import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(List<DateTime?>) onDateChanged;
  final VoidCallback onTimePickerTap;
  final DateTime currentTime;

  const CustomDatePicker({
    super.key,
    this.selectedDate,
    required this.onDateChanged,
    required this.onTimePickerTap,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            textAlign: TextAlign.center,
            selectedDate == null
                ? 'No se ha seleccionado una fecha'
                : 'Fecha seleccionada: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 20),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            selectedDayHighlightColor: Colors.deepPurple,
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            weekdayLabels: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
            controlsTextStyle: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedDate != null ? [selectedDate] : [],
          onValueChanged: onDateChanged,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onTimePickerTap,
          child: Text(
            DateFormat("HH:mm").format(currentTime),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}