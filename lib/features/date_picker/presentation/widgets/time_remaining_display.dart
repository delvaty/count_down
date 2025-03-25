import 'package:flutter/material.dart';
import '../../data/date_calculator.dart';
import '../../../../core/utils/date_utils.dart';

class TimeRemainingDisplay extends StatelessWidget {
  final DateCalculator dateCalculator;

  const TimeRemainingDisplay({
    super.key, 
    required this.dateCalculator
  });

  @override
  Widget build(BuildContext context) {
    return dateCalculator.selectedDate != null 
      ? Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tiempo Restante",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppDateUtils.formatRemainingTime(dateCalculator.timeDifference),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                _buildDetailRow("Total de días", "${dateCalculator.totalDays}"),
                _buildDetailRow("Total de horas", "${dateCalculator.totalHours}"),
                _buildDetailRow("Total de minutos", "${dateCalculator.totalMinutes}"),
                _buildDetailRow("Total de segundos", "${dateCalculator.totalSeconds}"),
              ],
            ),
          ),
        )
      : const SizedBox.shrink();
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}