import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/view/vehicle_details_page.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/vehicle_gps_tracker.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/widgets/vehicle_tile.dart';
import 'package:models/models.dart';

import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({required this.vehicle, super.key});
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 16,
      // aspectRatio: 1,
      child: BlocProvider(
        create: (context) => MileageCubit(
          vehiclesUseCase: VehiclesUseCase(vehicleRepository: context.read()),
          vehicleId: vehicle.id,
        ),
        child: VehicleCardContent(
          vehicle: vehicle,
        ),
      ),
    );
  }
}

class VehicleCardContent extends StatelessWidget {
  const VehicleCardContent({required this.vehicle, super.key});
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // color: Colors.cyan.shade50,
      // color: Colors.cyan,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(context, VehicleGpsTrackerPage.route(vehicle));
          Navigator.push(context, VehicleDetailsPage.route(vehicle: vehicle));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Hero(
                  tag: 'photo-${vehicle.id}',
                  child: Image.network(
                    vehicle.photo,
                    // width: 100,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.car_crash);
                    },
                  ),
                ),
              ),
              Text(
                vehicle.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Expanded(child: VehicleMileageIndicator()),
              Text(
                vehicle.id,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Gap(Consts.margin),
            ],
          ),
        ),
      ),
    );
  }
}
