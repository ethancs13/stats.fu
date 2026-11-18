import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() { _loading = true; _error = null; });
    try {
      final auth = ref.read(authRepositoryProvider);
      await auth.launchLogin();
      // Don't reset _loading here — we stay in loading state until
      // the deep link callback arrives and the completion callback fires.
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = 'Could not open browser. Please try again.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D2B1A), Color(0xFF0D0D0D)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1DB954),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.bar_chart_rounded,
                    color: Colors.black,
                    size: 48,
                  ),
                )
                    .animate()
                    .scale(delay: 200.ms, duration: 600.ms, curve: Curves.elasticOut),
                const SizedBox(height: 24),
                const Text(
                  'stats.fu',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -1.5,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 500.ms)
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 12),
                const Text(
                  'All your Spotify stats, completely free.\nNo paywalls. No limits.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB3B3B3),
                    height: 1.5,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 500.ms)
                    .slideY(begin: 0.2, end: 0),
                const Spacer(flex: 2),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: const [
                    _FeaturePill('Top Artists & Tracks'),
                    _FeaturePill('Listening Clock'),
                    _FeaturePill('Full History Import'),
                    _FeaturePill('Genre Breakdown'),
                    _FeaturePill('Artist Deep Stats'),
                  ],
                )
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 500.ms),
                const SizedBox(height: 40),
                if (_error != null) ...[
                  Text(
                    _error!,
                    style: const TextStyle(color: Color(0xFFFF4D4D)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ],
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: _loading ? null : _login,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF1DB954),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      disabledBackgroundColor: const Color(0xFF1DB954).withValues(alpha: 0.5),
                    ),
                    icon: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                          )
                        : const Icon(Icons.music_note_rounded, size: 22),
                    label: Text(
                      _loading ? 'Waiting for Spotify…' : 'Connect with Spotify',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 900.ms, duration: 400.ms)
                    .slideY(begin: 0.3, end: 0),
                const SizedBox(height: 16),
                const Text(
                  'We never store your data on external servers.\nAll stats are computed locally on your device.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B6B6B), height: 1.5),
                )
                    .animate()
                    .fadeIn(delay: 1000.ms, duration: 400.ms),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1DB954).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1DB954).withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, color: Color(0xFF1DB954), fontWeight: FontWeight.w500),
      ),
    );
  }
}
