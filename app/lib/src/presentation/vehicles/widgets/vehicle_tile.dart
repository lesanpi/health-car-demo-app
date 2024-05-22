import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';
import 'package:models/src/vehicle/vehicle.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({
    required this.vehicle,
    super.key,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MileageCubit(
        vehiclesUseCase: VehiclesUseCase(vehicleRepository: context.read()),
        vehicleId: vehicle.id,
      ),
      child: VehicleTileContent(vehicle: vehicle),
    );
  }
}

class VehicleTileContent extends StatelessWidget {
  const VehicleTileContent({
    required this.vehicle,
    super.key,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          vehicle.photo,
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        const Gap(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehicle.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                vehicle.id,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const VehicleMileageIndicator(),
            ],
          ),
        ),
      ],
    );
  }
}

class VehicleMileageIndicator extends StatelessWidget {
  const VehicleMileageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: BlocBuilder<MileageCubit, MileageState>(
        builder: (context, state) {
          final status = state.status;
          final data = state.data;
          if (status.isInProgress) {
            return LinearProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              color: Colors.grey.shade500,
            );
          }

          if (status.isFailure) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red.shade500,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.red.shade500,
                      value: 0.5,
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.read<MileageCubit>().onStarted();
                  },
                  icon: const Icon(Icons.wifi_protected_setup),
                ),
              ],
            );
          }

          if (data == null) {
            return const Center(
              child: Text(
                'No hay datos del kilometraje',
              ),
            );
          }

          final percentage = data.mileage / 5000;
          return Column(
            children: [
              Row(
                children: [
                  Text('${data.mileage} '),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: percentage,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const Text(' 5000 Km'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
