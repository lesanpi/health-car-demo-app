import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/cubit.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/widgets/vehicle_tile.dart';

import 'package:health_car_demo_app/src/presentation/vehicles/widgets/vehicle_card.dart';

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
    final controller = PageController(viewportFraction: 0.5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
          child: Text(
            'Vehículos en Demo',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
          child: Text(
            '''
Este es el listado de vehículos en los que se esta haciendo esta realizando esta demo''',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Gap(Consts.padding),
        const Expanded(child: VehiclesList()),
      ],
    );
  }
}

class VehiclesList extends StatelessWidget {
  const VehiclesList({
    super.key,
  });

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

        return AspectRatio(
          aspectRatio: 16 / 12,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(Consts.margin),
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              // log('photo: ${vehicle.photo}');
              return VehicleCard(vehicle: vehicle);
              // return VehicleTile(vehicle: vehicle);
            },
            itemCount: vehicles.length,
          ),
        );
      },
    );
  }
}
