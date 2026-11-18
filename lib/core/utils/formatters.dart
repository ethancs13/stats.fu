import 'package:intl/intl.dart';

class Formatters {
  static final _compact = NumberFormat.compact();
  static final _decimal = NumberFormat('#,###');

  static String compactNumber(num value) => _compact.format(value);

  static String fullNumber(num value) => _decimal.format(value);

  static String minutes(int ms) {
    final mins = (ms / 60000).round();
    if (mins < 60) return '$mins min';
    final h = mins ~/ 60;
    final m = mins % 60;
    if (m == 0) return '${h}h';
    return '${h}h ${m}m';
  }

  static String streams(int count) {
    if (count == 1) return '1 stream';
    return '${_compact.format(count)} streams';
  }

  static String duration(int ms) {
    final total = Duration(milliseconds: ms);
    final m = total.inMinutes;
    final s = total.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  static String relativeDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${diff.inDays ~/ 7} weeks ago';
    if (diff.inDays < 365) return '${diff.inDays ~/ 30} months ago';
    return '${diff.inDays ~/ 365} years ago';
  }

  static String shortDate(DateTime date) =>
      DateFormat('MMM d, y').format(date);

  static String percentChange(double change) {
    final sign = change >= 0 ? '+' : '';
    return '$sign${change.toStringAsFixed(0)}%';
  }
}
