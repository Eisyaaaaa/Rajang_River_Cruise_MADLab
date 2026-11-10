import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trip Preferences & Interactive Controls',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(height: 24),
            // Date Picker Tile
            ListTile(
              leading: const Icon(Icons.calendar_month, color: Colors.pink),
              title: const Text('Visit Date'),
              subtitle: Text(
                '${viewModel.selectedDate.day}/${viewModel.selectedDate.month}/${viewModel.selectedDate.year}',
              ),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: viewModel.selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  viewModel.setDate(picked);
                }
              },
            ),
            // Package Selection Dropdown
            ListTile(
              leading: const Icon(Icons.directions_boat, color: Colors.pink),
              title: const Text('Cruise Package'),
              trailing: DropdownButton<String>(
                value: viewModel.selectedPackage,
                items: viewModel.packageOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) => viewModel.setPackage(val),
              ),
            ),
            // Dark Mode Theme Toggle
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode, color: Colors.pink),
              title: const Text('Dark Mode Theme'),
              value: viewModel.isDarkMode,
              onChanged: (val) => viewModel.toggleTheme(val),
            ),
          ],
        ),
      ),
    );
  }
}