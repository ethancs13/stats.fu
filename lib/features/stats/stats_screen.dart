import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/spotify_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/artist.dart';
import '../../data/models/stream_history_entry.dart';
import '../../data/models/track.dart';
import '../../providers/history_providers.dart';
import '../../providers/spotify_providers.dart';
import 'widgets/top_artist_tile.dart';
import 'widgets/top_track_tile.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({super.key});

  @override
  ConsumerState<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen>
    with TickerProviderStateMixin {
  late final TabController _typeTab;
  late final TabController _rangeTab;

  static const _timeRanges = [
    (SpotifyConstants.shortTerm, '4 weeks'),
    (SpotifyConstants.mediumTerm, '6 months'),
    (SpotifyConstants.longTerm, 'All time'),
  ];

  @override
  void initState() {
    super.initState();
    _typeTab = TabController(length: 2, vsync: this);
    _rangeTab = TabController(length: 3, vsync: this, initialIndex: 1);
    _typeTab.addListener(() => setState(() {}));
    _rangeTab.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _typeTab.dispose();
    _rangeTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeRange = _timeRanges[_rangeTab.index].$1;
    final topArtists = ref.watch(topArtistsProvider(timeRange: timeRange));
    final topTracks = ref.watch(topTracksProvider(timeRange: timeRange));
    final historyArtists = ref.watch(historyTopArtistsProvider());
    final historyTracks = ref.watch(historyTopTracksProvider());

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            title: const Text('Stats'),
            floating: true,
            snap: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(88),
              child: Column(
                children: [
                  TabBar(
                    controller: _typeTab,
                    tabs: const [Tab(text: 'Artists'), Tab(text: 'Tracks')],
                    indicatorWeight: 2,
                  ),
                  _RangeSelector(
                    controller: _rangeTab,
                    ranges: _timeRanges.map((r) => r.$2).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _typeTab,
          children: [
            // Artists tab
            _buildArtistsList(topArtists, historyArtists, timeRange),
            // Tracks tab
            _buildTracksList(topTracks, historyTracks, timeRange),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistsList(
    AsyncValue<List<Artist>> topArtists,
    AsyncValue<List<ArtistHistoryStats>> historyArtists,
    String timeRange,
  ) {
    return topArtists.when(
      data: (artists) {
        final historyMap = <String, int>{};
        if (historyArtists.valueOrNull != null) {
          for (final h in historyArtists.value!) {
            historyMap[h.artistName.toLowerCase()] = h.streamCount;
          }
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          cacheExtent: 800,
          itemCount: artists.length,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
          itemBuilder: (context, i) {
            final artist = artists[i];
            final streams = historyMap[artist.name.toLowerCase()];
            // Only animate the first screen's worth of items
            final delay = i < 10 ? Duration(milliseconds: i * 40) : Duration.zero;
            return TopArtistTile(
              artist: artist,
              rank: i + 1,
              streamCount: streams,
              animationDelay: delay,
            );
          },
        );
      },
      loading: () => const _ListShimmer(),
      error: (e, _) => _ErrorWidget(message: e.toString()),
    );
  }

  Widget _buildTracksList(
    AsyncValue<List<Track>> topTracks,
    AsyncValue<List<TrackHistoryStats>> historyTracks,
    String timeRange,
  ) {
    return topTracks.when(
      data: (tracks) {
        final historyMap = <String, int>{};
        if (historyTracks.valueOrNull != null) {
          for (final h in historyTracks.value!) {
            final key = '${h.artistName.toLowerCase()}|${h.trackName.toLowerCase()}';
            historyMap[key] = h.streamCount;
          }
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          cacheExtent: 800,
          itemCount: tracks.length,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
          itemBuilder: (context, i) {
            final track = tracks[i];
            final key = '${track.artists.first.name.toLowerCase()}|${track.name.toLowerCase()}';
            final streams = historyMap[key];
            final delay = i < 10 ? Duration(milliseconds: i * 40) : Duration.zero;
            return TopTrackTile(
              track: track,
              rank: i + 1,
              streamCount: streams,
              animationDelay: delay,
            );
          },
        );
      },
      loading: () => const _ListShimmer(),
      error: (e, _) => _ErrorWidget(message: e.toString()),
    );
  }
}

class _RangeSelector extends StatelessWidget {
  const _RangeSelector({required this.controller, required this.ranges});
  final TabController controller;
  final List<String> ranges;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Row(
          children: ranges.indexed.map((pair) {
            final (i, label) = pair;
            final selected = controller.index == i;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => controller.animateTo(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.green : AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected ? Colors.black : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(width: 32, height: 20, decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 12),
            Container(width: 54, height: 54, decoration: const BoxDecoration(color: AppColors.surfaceElevated, shape: BoxShape.circle)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 15, decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4))),
                  const SizedBox(height: 6),
                  Container(width: 80, height: 12, decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, color: AppColors.textMuted, size: 48),
            const SizedBox(height: 16),
            const Text('Something went wrong', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(message, style: const TextStyle(color: AppColors.textMuted), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
