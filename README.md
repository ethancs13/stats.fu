# stats.fu

Free, open-source Spotify stats. Log in with Spotify to see your top tracks, artists and listening history, without paywalls.

Built with Flutter by **Ethan Sroka** ([LinkedIn](https://www.linkedin.com/in/ethan-sroka-8402631a2/) | [ethansroka.dev](https://ethansroka.dev)).

## Features
- **Spotify login** using the Spotify Web API (PKCE flow, no client secret stored in the app)
- **Home and stats:** top tracks and artists over the last 4 weeks, 6 months and all time, with charts
- **Track, artist and album details,** including Spotify popularity scores
- **Listening history:** recently played tracks, plus importing your Spotify data export
- **Last.fm integration** for extra listening stats
- **Discover and friends** screens

## Tech
Flutter, Riverpod (state), go_router (navigation), Dio (HTTP), Drift (local database), fl_chart (charts), freezed / json_serializable (models).

## Setup
1. Install [Flutter](https://docs.flutter.dev/get-started/install).
2. Register a Spotify app at the [Spotify developer dashboard](https://developer.spotify.com/dashboard) and add the redirect URI `com.statsfu.app://callback`. Put your client ID in `lib/core/constants/spotify_constants.dart`, or pass it with `--dart-define=SPOTIFY_CLIENT_ID=...`.
3. Get a free Last.fm API key at https://www.last.fm/api/account/create.
4. Copy `.env.example.json` to `.env.json` and add your Last.fm key. `.env.json` is git-ignored.
5. Install packages and run:
   ```bash
   flutter pub get
   flutter run --dart-define-from-file=.env.json
   ```
   In VS Code, the included launch configurations pass `.env.json` automatically.
