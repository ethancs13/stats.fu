class SpotifyConstants {
  // Register your own Spotify app at https://developer.spotify.com/dashboard
  // then put your client ID here (or in a .env file for production)
  static const clientId = String.fromEnvironment(
    'SPOTIFY_CLIENT_ID',
    defaultValue: '32c687da31194ba981b852e7227e782e',
  );

  static const redirectUri = 'com.statsfu.app://callback';

  static const baseUrl = 'https://api.spotify.com/v1';
  static const authUrl = 'https://accounts.spotify.com/authorize';
  static const tokenUrl = 'https://accounts.spotify.com/api/token';

  static const scopes = [
    'user-read-private',
    'user-read-email',
    'user-top-read',
    'user-read-recently-played',
    'user-follow-read',
    'user-library-read',
  ];

  static const shortTerm = 'short_term';
  static const mediumTerm = 'medium_term';
  static const longTerm = 'long_term';

  static const maxTopItems = 50;
  static const maxRecentlyPlayed = 50;
}
