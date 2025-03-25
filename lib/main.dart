import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/date_picker/presentation/pages/date_picker_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time Remaining Calculator",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DatePickerPage(),
    );
  }
}