import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:health_car_demo_app/app/constant.dart';
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
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (status.isFailure) {
          return const Center(
            child: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(vehicle.photo),
                  Text(
                    vehicle.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    vehicle.id,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            },
            itemCount: vehicles.length,
          ),
        );
      },
    );
  }
}
