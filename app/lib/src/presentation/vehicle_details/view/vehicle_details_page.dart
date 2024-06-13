import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/vehicle_details_body.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/vehicles.dart';
import 'package:models/models.dart';

import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';

/// {@template vehicle_details_page}
/// A description for VehicleDetailsPage
/// {@endtemplate}
class VehicleDetailsPage extends StatelessWidget {
  /// {@macro vehicle_details_page}
  const VehicleDetailsPage({required this.vehicle, super.key});
  final Vehicle vehicle;

  /// The static route for VehicleDetailsPage
  static Route<dynamic> route({
    required Vehicle vehicle,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => VehicleDetailsPage(
        vehicle: vehicle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehicleDetailsBloc(
            vehicle: vehicle,
            vehiclesUseCase: VehiclesUseCase(vehicleRepository: context.read()),
          ),
        ),
        BlocProvider(
          create: (context) => MileageCubit(
            vehiclesUseCase: VehiclesUseCase(vehicleRepository: context.read()),
            vehicleId: vehicle.id,
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          // title: Text(vehicle.name),
          title: const Text(
            'Detalles del Vehiculo',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: const VehicleDetailsView(),
      ),
    );
  }
}

/// {@template vehicle_details_view}
/// Displays the Body of VehicleDetailsView
/// {@endtemplate}
class VehicleDetailsView extends StatelessWidget {
  /// {@macro vehicle_details_view}
  const VehicleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: VehicleDetailsBody());
  }
}
