import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/cubit.dart';

/// {@template vehicles_body}
/// Body of the VehiclesPage.
///
/// Add what it does
/// {@endtemplate}
class VehiclesBody extends StatelessWidget {
  /// {@macro vehicles_body}
  const VehiclesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesCubit, VehiclesState>(
      builder: (context, state) {
        final status = state.status;
        final vehicles = state.data;
        if (status.isInitial || status.isInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(child: Text(vehicles.toString()));
      },
    );
  }
}
