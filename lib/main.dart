import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pastel Pink Color Scheme Setup
    const Color primaryPastelPink = Color(0xFFFFB7B2);
    const Color accentPastelPink = Color(0xFFFFDAC1);

    return MaterialApp(
      title: 'Rajang River Cruise App',
      debugShowCheckedModeBanner: false,
      themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPastelPink,
          primary: const Color(0xFFE57373),
          secondary: accentPastelPink,
          surface: const Color(0xFFFFF0F5), // LavenderBlush/Pastel Pink Tint
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF5F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFC0CB),
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFB7B2),
          secondary: Color(0xFFFFDAC1),
        ),
      ),
      home: CruiseBookingScreen(viewModel: _viewModel),
    );
  }
}