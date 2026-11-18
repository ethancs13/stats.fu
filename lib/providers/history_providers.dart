import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/stream_history_entry.dart';
import '../data/repositories/history_repository.dart';

part 'history_providers.g.dart';

@riverpod
Stream<int> historyCount(HistoryCountRef ref) {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.watchHistoryCount();
}

@riverpod
Future<List<ArtistHistoryStats>> historyTopArtists(
  HistoryTopArtistsRef ref, {
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getTopArtists(from: startDate, to: endDate);
}

@riverpod
Future<List<TrackHistoryStats>> historyTopTracks(
  HistoryTopTracksRef ref, {
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getTopTracks(from: startDate, to: endDate);
}

@riverpod
Future<int> historyTotalStreams(
  HistoryTotalStreamsRef ref, {
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getTotalStreamCount(from: startDate, to: endDate);
}

@riverpod
Future<int> historyTotalMs(
  HistoryTotalMsRef ref, {
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getTotalMsPlayed(from: startDate, to: endDate);
}

@riverpod
Future<List<int>> listeningClock(
  ListeningClockRef ref, {
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getListeningClock(from: startDate, to: endDate);
}

@riverpod
Future<ArtistHistoryStats?> artistHistoryStats(
  ArtistHistoryStatsRef ref,
  String artistName,
) async {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.getArtistStats(artistName);
}
