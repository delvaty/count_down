class DateCalculator {
  DateTime? selectedDate;
  DateTime currentTime;

  DateCalculator({
    this.selectedDate,
    DateTime? initialTime,
  }) : currentTime = initialTime ?? DateTime.now();

  void updateSelectedDate(DateTime? date) {
    selectedDate = date;
  }

  void updateCurrentTime(DateTime newTime) {
    currentTime = newTime;
  }

  Duration get timeDifference {
    if (selectedDate == null) {
      return Duration.zero;
    }
    return selectedDate!.difference(currentTime);
  }

  int get totalDays => timeDifference.inDays;
  int get totalHours => timeDifference.inHours;
  int get totalMinutes => timeDifference.inMinutes;
  int get totalSeconds => timeDifference.inSeconds;
}