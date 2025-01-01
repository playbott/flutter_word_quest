extension DurationFormatting on Duration {
  String toHMS() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    return "$inHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String toHMS2() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    return "${inHours > 0 ? '$inHours:' : ''}${twoDigitMinutes != '00' ? '$twoDigitMinutes:' : ''}$twoDigitSeconds";
  }
}

double getProgressPercentage(Duration currentPosition, Duration totalDuration) {
  return (currentPosition.inMilliseconds / totalDuration.inMilliseconds) * 100;
}