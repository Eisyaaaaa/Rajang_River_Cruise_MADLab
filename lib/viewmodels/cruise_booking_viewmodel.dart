import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination _destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and traditional waterfront settlements while experiencing authentic Sarawakian hospitality.',
    imagePath: 'assets/images/sibu_cruise.jpg',
    starCount: 41,
  );

  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;
  bool _isStarred = false;

  // Getters
  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  bool get isStarred => _isStarred;

  final List<String> packageOptions = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Actions
  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setPackage(String? package) {
    if (package != null) {
      _selectedPackage = package;
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleStar() {
    _isStarred = !_isStarred;
    if (_isStarred) {
      _destination.starCount++;
    } else {
      _destination.starCount--;
    }
    notifyListeners();
  }
}