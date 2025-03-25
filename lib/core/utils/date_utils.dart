class AppDateUtils {
  static String formatRemainingTime(Duration difference) {
    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 365) % 30;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    return '$years años, $months meses, $days días, '
           '$hours horas, $minutes minutos y $seconds segundos';
  }
}