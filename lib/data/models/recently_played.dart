import 'package:freezed_annotation/freezed_annotation.dart';
import 'track.dart';

part 'recently_played.freezed.dart';
part 'recently_played.g.dart';

@freezed
abstract class RecentlyPlayedItem with _$RecentlyPlayedItem {
  const factory RecentlyPlayedItem({
    required Track track,
    required DateTime playedAt,
  }) = _RecentlyPlayedItem;

  factory RecentlyPlayedItem.fromJson(Map<String, dynamic> json) =>
      _$RecentlyPlayedItemFromJson(json);
}
