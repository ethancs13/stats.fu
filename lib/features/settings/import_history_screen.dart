import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../data/repositories/history_repository.dart';
import '../../providers/history_providers.dart';

class ImportHistoryScreen extends ConsumerStatefulWidget {
  const ImportHistoryScreen({super.key});

  @override
  ConsumerState<ImportHistoryScreen> createState() => _ImportHistoryScreenState();
}

class _ImportHistoryScreenState extends ConsumerState<ImportHistoryScreen> {
  _ImportState _state = _ImportState.idle;
  int _imported = 0;
  String? _error;

  Future<void> _pickAndImport() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      allowMultiple: true,
      dialogTitle: 'Select Spotify Streaming History files',
    );

    if (result == null || result.files.isEmpty) return;

    setState(() { _state = _ImportState.importing; _error = null; });

    try {
      final paths = result.files.map((f) => f.path!).toList();
      final repo = ref.read(historyRepositoryProvider);
      final count = await repo.importFromFiles(paths);
      ref.invalidate(historyCountProvider);
      if (mounted) {
        setState(() {
          _state = _ImportState.done;
          _imported = count;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _state = _ImportState.error;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Import History')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            const SizedBox(height: 32),
            _StepCard(
              step: '1',
              title: 'Request your Spotify data',
              body: 'Go to spotify.com/account/privacy → "Download your data" → Request "Extended streaming history". Spotify sends a download link within 30 days.',
              icon: Icons.download_rounded,
            ),
            const SizedBox(height: 12),
            _StepCard(
              step: '2',
              title: 'Extract the ZIP file',
              body: 'Unzip the downloaded file. Look for files named StreamingHistory_music_0.json (and _1, _2, etc. if you have a long history).',
              icon: Icons.folder_zip_rounded,
            ),
            const SizedBox(height: 12),
            _StepCard(
              step: '3',
              title: 'Import the files',
              body: 'Tap the button below and select all StreamingHistory_music_*.json files. Everything is processed locally on your device — no data is sent anywhere.',
              icon: Icons.upload_rounded,
            ),
            const SizedBox(height: 32),

            // Status display
            if (_state == _ImportState.done) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.green.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Import complete!', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          Text('$_imported streams imported', style: const TextStyle(color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .scale(duration: 400.ms, curve: Curves.elasticOut),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.go('/home'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('View my stats', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                ),
              ),
            ] else if (_state == _ImportState.error) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Import failed: ${_error ?? 'Unknown error'}',
                        style: const TextStyle(color: AppColors.textMuted),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Import button
            if (_state != _ImportState.done)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _state == _ImportState.importing ? null : _pickAndImport,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    disabledBackgroundColor: AppColors.green.withValues(alpha: 0.4),
                  ),
                  icon: _state == _ImportState.importing
                      ? const SizedBox(
                          width: 20, height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                        )
                      : const Icon(Icons.upload_file_rounded),
                  label: Text(
                    _state == _ImportState.importing ? 'Importing...' : 'Select JSON files',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),

            const SizedBox(height: 24),
            const _PrivacyNote(),
          ],
        ),
      ),
    );
  }
}

enum _ImportState { idle, importing, done, error }

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.green.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.upload_rounded, color: AppColors.green, size: 32),
        )
            .animate()
            .scale(delay: 100.ms, duration: 500.ms, curve: Curves.elasticOut),
        const SizedBox(height: 16),
        const Text(
          'Import your lifetime\nstreaming history',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.2, letterSpacing: -0.5),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 400.ms)
            .slideY(begin: 0.1, end: 0),
        const SizedBox(height: 8),
        const Text(
          'Get total stream counts, listening clock data, first/last played dates, and more — all for free.',
          style: TextStyle(fontSize: 15, color: AppColors.textMuted, height: 1.5),
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 400.ms),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.step, required this.title, required this.body, required this.icon});
  final String step;
  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.green.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                const SizedBox(height: 4),
                Text(body, style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacyNote extends StatelessWidget {
  const _PrivacyNote();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.lock_outline_rounded, color: AppColors.textMuted, size: 16),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Your data never leaves your device. All processing happens locally.',
            style: TextStyle(fontSize: 12, color: AppColors.textMuted, height: 1.4),
          ),
        ),
      ],
    );
  }
}
