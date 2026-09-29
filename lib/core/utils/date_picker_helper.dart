import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<void> selectDate({
    required BuildContext context,
    required TextEditingController controller,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
    );

    if (pickedDate != null) {
      final formattedMonth = pickedDate.month.toString().padLeft(2, '0');
      final formattedDay = pickedDate.day.toString().padLeft(2, '0');

      controller.text = "${pickedDate.year}-$formattedMonth-$formattedDay";
    }
  }
}
