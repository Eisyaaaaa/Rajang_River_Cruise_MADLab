import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sibu River Cruise & Heritage'),
            centerTitle: true,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                // Portrait Mode Layout: Single Column ListView
                return ListView(
                  children: [
                    HeaderImageWidget(imagePath: viewModel.destination.imagePath),
                    TitleSectionWidget(
                      title: viewModel.destination.title,
                      location: viewModel.destination.location,
                      starCount: viewModel.destination.starCount,
                      isStarred: viewModel.isStarred,
                      onStarPressed: () => viewModel.toggleStar(),
                    ),
                    const ActionBarWidget(),
                    DescriptionWidget(description: viewModel.destination.description),
                    BookingControlsWidget(viewModel: viewModel),
                  ],
                );
              } else {
                // Landscape Mode Layout: Side-by-Side Split View (Row + Expanded)
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: HeaderImageWidget(imagePath: viewModel.destination.imagePath),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: [
                          TitleSectionWidget(
                            title: viewModel.destination.title,
                            location: viewModel.destination.location,
                            starCount: viewModel.destination.starCount,
                            isStarred: viewModel.isStarred,
                            onStarPressed: () => viewModel.toggleStar(),
                          ),
                          const ActionBarWidget(),
                          DescriptionWidget(description: viewModel.destination.description),
                          BookingControlsWidget(viewModel: viewModel),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}