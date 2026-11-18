class LastFmUser {
  const LastFmUser({
    required this.name,
    required this.playCount,
    this.imageUrl,
    this.registeredAt,
    this.country,
  });

  final String name;
  final int playCount;
  final String? imageUrl;
  final DateTime? registeredAt;
  final String? country;

  factory LastFmUser.fromJson(Map<String, dynamic> j) {
    final images = j['image'] as List?;
    final largeImage = images?.lastWhere(
      (i) => i['size'] == 'extralarge',
      orElse: () => images.isNotEmpty ? images.last : null,
    );
    return LastFmUser(
      name: j['name'] as String,
      playCount: int.tryParse(j['playcount']?.toString() ?? '0') ?? 0,
      imageUrl: largeImage?['#text'] as String?,
      registeredAt: j['registered']?['unixtime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.parse(j['registered']['unixtime'].toString()) * 1000)
          : null,
      country: j['country'] as String?,
    );
  }
}

class LastFmArtist {
  const LastFmArtist({
    required this.name,
    required this.playCount,
    this.imageUrl,
    this.url,
  });

  final String name;
  final int playCount;
  final String? imageUrl;
  final String? url;

  factory LastFmArtist.fromJson(Map<String, dynamic> j) {
    final images = j['image'] as List?;
    final large = images?.lastWhere(
      (i) => i['size'] == 'extralarge',
      orElse: () => images.isNotEmpty ? images.last : null,
    );
    return LastFmArtist(
      name: j['name'] as String,
      playCount: int.tryParse(j['playcount']?.toString() ?? '0') ?? 0,
      imageUrl: large?['#text'] as String?,
      url: j['url'] as String?,
    );
  }
}

class LastFmTrack {
  const LastFmTrack({
    required this.name,
    required this.artistName,
    required this.playCount,
    this.imageUrl,
    this.url,
  });

  final String name;
  final String artistName;
  final int playCount;
  final String? imageUrl;
  final String? url;

  factory LastFmTrack.fromJson(Map<String, dynamic> j) {
    final images = j['image'] as List?;
    final large = images?.lastWhere(
      (i) => i['size'] == 'extralarge',
      orElse: () => images.isNotEmpty ? images.last : null,
    );
    final artist = j['artist'];
    final artistName = artist is Map ? artist['name'] as String? ?? '' : artist?.toString() ?? '';
    return LastFmTrack(
      name: j['name'] as String,
      artistName: artistName,
      playCount: int.tryParse(j['playcount']?.toString() ?? '0') ?? 0,
      imageUrl: large?['#text'] as String?,
      url: j['url'] as String?,
    );
  }
}

class LastFmRecentTrack {
  const LastFmRecentTrack({
    required this.name,
    required this.artistName,
    required this.albumName,
    this.imageUrl,
    this.playedAt,
    this.nowPlaying = false,
  });

  final String name;
  final String artistName;
  final String albumName;
  final String? imageUrl;
  final DateTime? playedAt;
  final bool nowPlaying;

  factory LastFmRecentTrack.fromJson(Map<String, dynamic> j) {
    final attr = j['@attr'] as Map?;
    final nowPlaying = attr?['nowplaying'] == 'true';
    DateTime? playedAt;
    if (!nowPlaying && j['date'] != null) {
      final uts = j['date']['uts']?.toString();
      if (uts != null) {
        playedAt = DateTime.fromMillisecondsSinceEpoch(
            int.parse(uts) * 1000);
      }
    }
    final images = j['image'] as List?;
    final large = images?.lastWhere(
      (i) => i['size'] == 'extralarge',
      orElse: () => images.isNotEmpty ? images.last : null,
    );
    return LastFmRecentTrack(
      name: j['name'] as String? ?? '',
      artistName: (j['artist']?['#text'] ?? j['artist']?['name'] ?? '') as String,
      albumName: (j['album']?['#text'] ?? '') as String,
      imageUrl: large?['#text'] as String?,
      playedAt: playedAt,
      nowPlaying: nowPlaying,
    );
  }
}
