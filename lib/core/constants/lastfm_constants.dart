class LastFmConstants {
  // Register a free API key at https://www.last.fm/api/account/create
  // and put it in .env.json (not committed). Run with --dart-define-from-file=.env.json
  static const apiKey = String.fromEnvironment('LASTFM_API_KEY');

  static const baseUrl = 'https://ws.audioscrobbler.com/2.0/';

  // Period values accepted by the Last.fm API
  static const overall = 'overall';
  static const week = '7day';
  static const month = '1month';
  static const threeMonths = '3month';
  static const sixMonths = '6month';
  static const year = '12month';
}
