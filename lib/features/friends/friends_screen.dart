import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../data/models/spotify_image.dart';
import '../../providers/auth_provider.dart';
import '../../providers/spotify_providers.dart';

class FriendsScreen extends ConsumerWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followedAsync = ref.watch(followedArtistsProvider);
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Friends & Artists'), floating: true, snap: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile sharing card
                  userAsync.when(
                    data: (user) => _ProfileCard(user: user),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Following',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    followedAsync.valueOrNull != null
                        ? '${followedAsync.value!.length} artists'
                        : '',
                    style: const TextStyle(fontSize: 14, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          followedAsync.when(
            data: (artists) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final artist = artists[i];
                  final imageUrl = artist.images.isNotEmpty ? artist.images.medium : null;
                  return GestureDetector(
                    onTap: () => context.push('/artist/${artist.id}'),
                    child: Padding(
                      padding: EdgeInsets.only(left: i % 3 == 0 ? 16 : 0, right: i % 3 == 2 ? 16 : 0),
                      child: Column(
                        children: [
                          ClipOval(
                            child: imageUrl != null
                                ? CachedNetworkImage(imageUrl: imageUrl, width: 80, height: 80, fit: BoxFit.cover)
                                : Container(width: 80, height: 80, color: AppColors.surface,
                                    child: const Icon(Icons.person_rounded, color: AppColors.textMuted)),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            artist.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: Duration(milliseconds: i * 30), duration: 300.ms)
                      .scale(begin: const Offset(0.92, 0.92), end: const Offset(1, 1));
                },
                childCount: artists.length,
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(color: AppColors.green)),
            ),
            error: (e, _) => SliverFillRemaining(
              child: Center(child: Text('Error: $e')),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.user});
  final dynamic user;

  @override
  Widget build(BuildContext context) {
    final profileUrl = 'https://stats.fu/profile/${user.id}';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.surfaceElevated,
                backgroundImage: user.images.isNotEmpty
                    ? CachedNetworkImageProvider(user.images.first.url as String)
                    : null,
                child: user.images.isEmpty
                    ? Text(
                        (user.displayName as String).isNotEmpty
                            ? (user.displayName as String)[0].toUpperCase()
                            : '?',
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName as String,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      user.followersTotal != null
                          ? '${Formatters.compactNumber(user.followersTotal as int)} followers'
                          : 'Spotify user',
                      style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Share your profile',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    profileUrl,
                    style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: profileUrl));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link copied!'),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.copy_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 100.ms, duration: 400.ms)
        .slideY(begin: 0.05, end: 0);
  }
}
