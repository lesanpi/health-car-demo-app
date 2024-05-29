import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/domain/use_cases/location_use_case.dart';
import 'package:health_car_demo_app/src/presentation/permission_handler/permission_handler.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/widgets/vehicle_gps_tracker_body.dart';
import 'package:models/models.dart';
import 'package:permission_handler/permission_handler.dart';

/// {@template vehicle_gps_tracker_page}
/// A description for VehicleGpsTrackerPage
/// {@endtemplate}
class VehicleGpsTrackerPage extends StatelessWidget {
  /// {@macro vehicle_gps_tracker_page}
  const VehicleGpsTrackerPage({required this.vehicle, super.key});

  static Route<dynamic> route(Vehicle vehicle) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => VehicleGpsTrackerPage(
        vehicle: vehicle,
      ),
    );
  }

  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehicleGpsTrackerBloc(
            vehicle: vehicle,
            locationUseCase: LocationUseCase(
              geolocationRepository: context.read(),
              vehicleRepository: context.read(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PermissionHandlerBloc(
            permissionsToValidate: [
              Permission.location,
              Permission.locationWhenInUse,
              Permission.locationAlways,
            ],
          ),
        ),
      ],
      child: const Scaffold(
        // appBar: AppBar(
        //   title: Text(vehicle.name),
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        // ),
        body: VehicleGpsTrackerView(),
      ),
    );
  }
}

/// {@template vehicle_gps_tracker_view}
/// Displays the Body of VehicleGpsTrackerView
/// {@endtemplate}
class VehicleGpsTrackerView extends StatelessWidget {
  /// {@macro vehicle_gps_tracker_view}
  const VehicleGpsTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const VehicleGpsTrackerBody();
  }
}
