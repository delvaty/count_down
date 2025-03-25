import 'package:flutter/material.dart';

import '../widgets/custom_date_picker.dart';
import '../widgets/time_remaining_display.dart';
import '../../data/date_calculator.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  DatePickerPageState createState() => DatePickerPageState();
}

class DatePickerPageState extends State<DatePickerPage> {
  late DateCalculator _dateCalculator;

  @override
  void initState() {
    super.initState();
    _dateCalculator = DateCalculator();
  }

  void _onDateChanged(List<DateTime?> dates) {
    if (dates.isNotEmpty && dates[0] != null) {
      setState(() {
        _dateCalculator.updateSelectedDate(dates[0]);
      });
    }
  }

  void _showTimePickerDialog() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateCalculator.currentTime),
    ).then((selectedTime) {
      if (selectedTime != null) {
        setState(() {
          _dateCalculator.updateCurrentTime(
            DateTime.now().copyWith(
              hour: selectedTime.hour,
              minute: selectedTime.minute,
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Tiempo Restante'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDatePicker(
                selectedDate: _dateCalculator.selectedDate,
                onDateChanged: _onDateChanged,
                onTimePickerTap: _showTimePickerDialog,
                currentTime: _dateCalculator.currentTime,
              ),
              TimeRemainingDisplay(dateCalculator: _dateCalculator),
            ],
          ),
        ),
      ),
    );
  }
}