import 'package:flutter/material.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/cubit.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/widgets/vehicles_body.dart';

/// {@template vehicles_page}
/// A description for VehiclesPage
/// {@endtemplate}
class VehiclesPage extends StatelessWidget {
  /// {@macro vehicles_page}
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehiclesCubit(
        VehiclesUseCase(
          vehicleRepository: context.read(),
        ),
      ),
      child: const VehiclesView(),
    );
  }
}

/// {@template vehicles_view}
/// Displays the Body of VehiclesView
/// {@endtemplate}
class VehiclesView extends StatelessWidget {
  /// {@macro vehicles_view}
  const VehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const VehiclesBody();
  }
}
