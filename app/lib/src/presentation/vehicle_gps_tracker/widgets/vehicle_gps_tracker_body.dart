import 'package:flutter/material.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/widgets/map_view.dart';

/// {@template vehicle_gps_tracker_body}
/// Body of the VehicleGpsTrackerPage.
///
/// Add what it does
/// {@endtemplate}
class VehicleGpsTrackerBody extends StatelessWidget {
  /// {@macro vehicle_gps_tracker_body}
  const VehicleGpsTrackerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: MapView()),
        Positioned(
          left: Consts.margin,
          // right: Consts.margin,
          top: MediaQuery.viewPaddingOf(context).top,
          height: 60,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
