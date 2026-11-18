import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../data/repositories/history_repository.dart';
import '../../features/lastfm/lastfm_connect_card.dart';
import '../../providers/history_providers.dart';
import '../../providers/lastfm_providers.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  final _searchController = TextEditingController();
  String _filter = '';

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _tabs.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabs.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastFmConnected = ref.watch(lastFmConnectedProvider).valueOrNull ?? false;
    final historyCount = ref.watch(historyCountProvider);
    final hasLocalHistory = (historyCount.valueOrNull ?? 0) > 0;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            title: const Text('History'),
            floating: true,
            snap: true,
            actions: [
              if (hasLocalHistory)
                IconButton(
                  icon: const Icon(Icons.upload_rounded),
                  onPressed: () => context.push('/import'),
                  tooltip: 'Import Spotify data',
                ),
            ],
            bottom: (isLastFmConnected || hasLocalHistory)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(46),
                    child: TabBar(
                      controller: _tabs,
                      tabs: const [
                        Tab(text: 'Last.fm'),
                        Tab(text: 'Spotify import'),
                      ],
                    ),
                  )
                : null,
          ),
        ],
        body: (isLastFmConnected || hasLocalHistory)
            ? TabBarView(
                controller: _tabs,
                children: [
                  _LastFmHistoryTab(),
                  _LocalHistoryTab(
                    filter: _filter,
                    searchController: _searchController,
                    onFilterChanged: (v) => setState(() => _filter = v),
                  ),
                ],
              )
            : _EmptyHistoryState(),
      ),
    );
  }
}

// ── Last.fm tab ───────────────────────────────────────────────────────────────

class _LastFmHistoryTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(lastFmConnectedProvider).valueOrNull ?? false;

    if (!isConnected) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LastFmConnectCard(compact: false),
            const SizedBox(height: 24),
            _WhatIsLastFm(),
          ],
        ),
      );
    }

    final recentAsync = ref.watch(lastFmRecentTracksProvider(limit: 50));
    final userAsync = ref.watch(lastFmUserProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LastFmConnectCard(compact: true),
                const SizedBox(height: 16),
                userAsync.when(
                  data: (user) => user != null
                      ? _StatRow(
                          label: 'Total scrobbles',
                          value: Formatters.compactNumber(user.playCount),
                        )
                      : const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Recently played',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        recentAsync.when(
          data: (tracks) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final t = tracks[i];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  leading: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: t.imageUrl != null && t.imageUrl!.isNotEmpty
                            ? CachedNetworkImage(imageUrl: t.imageUrl!, width: 48, height: 48, fit: BoxFit.cover)
                            : Container(width: 48, height: 48, color: AppColors.surface,
                                child: const Icon(Icons.music_note_rounded, color: AppColors.textMuted)),
                      ),
                      if (t.nowPlaying)
                        Positioned(
                          right: 0, bottom: 0,
                          child: Container(
                            width: 14, height: 14,
                            decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                            child: const Icon(Icons.play_arrow_rounded, size: 10, color: Colors.black),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    t.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: t.nowPlaying ? AppColors.green : AppColors.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    t.artistName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                  ),
                  trailing: t.nowPlaying
                      ? const Text('Now playing', style: TextStyle(fontSize: 11, color: AppColors.green))
                      : t.playedAt != null
                          ? Text(
                              Formatters.relativeDate(t.playedAt!),
                              style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                            )
                          : null,
                )
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: i < 10 ? i * 30 : 0), duration: 300.ms);
              },
              childCount: tracks.length,
            ),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator(color: AppColors.green)),
          ),
          error: (e, _) => SliverFillRemaining(child: Center(child: Text('$e'))),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}

// ── Local (imported) history tab ──────────────────────────────────────────────

class _LocalHistoryTab extends ConsumerStatefulWidget {
  const _LocalHistoryTab({
    required this.filter,
    required this.searchController,
    required this.onFilterChanged,
  });
  final String filter;
  final TextEditingController searchController;
  final void Function(String) onFilterChanged;

  @override
  ConsumerState<_LocalHistoryTab> createState() => _LocalHistoryTabState();
}

class _LocalHistoryTabState extends ConsumerState<_LocalHistoryTab> {
  @override
  Widget build(BuildContext context) {
    final historyCount = ref.watch(historyCountProvider);
    final count = historyCount.valueOrNull ?? 0;

    if (count == 0) {
      return _ImportPrompt();
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${Formatters.fullNumber(count)} streams imported',
                  style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: widget.searchController,
                  onChanged: widget.onFilterChanged,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Search tracks or artists…',
                    hintStyle: const TextStyle(color: AppColors.textMuted),
                    prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                    suffixIcon: widget.filter.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, color: AppColors.textMuted),
                            onPressed: () => widget.onFilterChanged(''),
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
        _LocalHistoryList(filter: widget.filter),
      ],
    );
  }
}

class _LocalHistoryList extends ConsumerStatefulWidget {
  const _LocalHistoryList({required this.filter});
  final String filter;

  @override
  ConsumerState<_LocalHistoryList> createState() => _LocalHistoryListState();
}

class _LocalHistoryListState extends ConsumerState<_LocalHistoryList> {
  static const _pageSize = 50;
  final _items = <dynamic>[];
  bool _loading = false;
  bool _hasMore = true;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(_LocalHistoryList old) {
    super.didUpdateWidget(old);
    if (old.filter != widget.filter) {
      setState(() { _items.clear(); _offset = 0; _hasMore = true; });
      _load();
    }
  }

  Future<void> _load() async {
    if (_loading || !_hasMore) return;
    setState(() => _loading = true);
    final repo = ref.read(historyRepositoryProvider);
    final page = await repo.getHistoryPage(
      limit: _pageSize,
      offset: _offset,
      artistFilter: widget.filter.isNotEmpty ? widget.filter : null,
      trackFilter: widget.filter.isNotEmpty ? widget.filter : null,
    );
    if (mounted) {
      setState(() {
        _items.addAll(page);
        _offset += page.length;
        _hasMore = page.length == _pageSize;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty && _loading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator(color: AppColors.green)),
      );
    }
    if (_items.isEmpty) {
      return const SliverFillRemaining(
        child: Center(child: Text('No results', style: TextStyle(color: AppColors.textMuted))),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i == _items.length) {
            if (_hasMore) {
              WidgetsBinding.instance.addPostFrameCallback((_) => _load());
              return const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator(color: AppColors.green)),
              );
            }
            return null;
          }
          final entry = _items[i];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            leading: Container(
              width: 42, height: 42,
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.music_note_rounded, color: AppColors.textMuted, size: 20),
            ),
            title: Text(entry.trackName as String? ?? 'Unknown', maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: Text(entry.artistName as String? ?? 'Unknown', maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: AppColors.textMuted)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(Formatters.relativeDate(entry.ts as DateTime),
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                Text(Formatters.duration(entry.msPlayed as int),
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          );
        },
        childCount: _items.length + (_hasMore ? 1 : 0),
      ),
    );
  }
}

// ── Empty / prompts ───────────────────────────────────────────────────────────

class _EmptyHistoryState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
            child: const Icon(Icons.history_rounded, size: 48, color: AppColors.textMuted),
          )
              .animate()
              .scale(delay: 100.ms, duration: 500.ms, curve: Curves.elasticOut),
          const SizedBox(height: 20),
          const Text('No history yet',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))
              .animate().fadeIn(delay: 200.ms, duration: 400.ms),
          const SizedBox(height: 8),
          const Text(
            'Connect Last.fm to see your full scrobble history, or import your Spotify data export.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted, fontSize: 15, height: 1.5),
          )
              .animate().fadeIn(delay: 300.ms, duration: 400.ms),
          const SizedBox(height: 28),
          const LastFmConnectCard()
              .animate().fadeIn(delay: 400.ms, duration: 400.ms).slideY(begin: 0.05, end: 0),
          const SizedBox(height: 16),
          _ImportPromptCompact(),
        ],
      ),
    );
  }
}

class _ImportPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.upload_rounded, size: 48, color: AppColors.textMuted),
            const SizedBox(height: 16),
            const Text('No imported data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text(
              'Import your Spotify Extended Streaming History to see every track you\'ve ever played.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textMuted, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => context.push('/import'),
              icon: const Icon(Icons.upload_file_rounded),
              label: const Text('Import History'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImportPromptCompact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/import'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          children: [
            Icon(Icons.upload_rounded, color: AppColors.textMuted, size: 20),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Import Spotify history',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text('Optional: upload your Spotify data export for lifetime stats',
                      style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.green)),
        ],
      ),
    );
  }
}

class _WhatIsLastFm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('What is Last.fm?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text(
            'Last.fm is a free music tracking service. When connected to Spotify, it automatically logs every track you play — building a complete listening history over time.',
            style: TextStyle(fontSize: 14, color: AppColors.textMuted, height: 1.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'Don\'t have an account? Create one free at last.fm — it takes 30 seconds.',
            style: TextStyle(fontSize: 13, color: AppColors.textMuted, height: 1.5),
          ),
        ],
      ),
    );
  }
}
