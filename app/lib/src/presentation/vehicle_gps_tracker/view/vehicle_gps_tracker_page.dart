import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/domain/use_cases/location_use_case.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/permission_handler/permission_handler.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/animated_counter_text.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/widgets/vehicle_gps_tracker_body.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';
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
          create: (context) => MileageCubit(
            vehiclesUseCase: VehiclesUseCase(vehicleRepository: context.read()),
            vehicleId: vehicle.id,
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
        bottomSheet: VehicleGpsTrackerBottomSheet(),
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

class VehicleGpsTrackerBottomSheet extends StatelessWidget {
  const VehicleGpsTrackerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicle = context.read<VehicleGpsTrackerBloc>().vehicle;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Consts.margin),
        child: SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(Consts.margin),
                Row(
                  children: [
                    Transform.flip(
                      flipX: true,
                      child: Image.network(
                        vehicle.photo,
                        height: 100,
                      )
                          .animate(
                            delay: 300.ms,
                          )
                          .slideX(
                            duration: 400.ms,
                            curve: Curves.linearToEaseOut,
                            begin: 1,
                          ),
                    ),
                    const Gap(Consts.margin),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            vehicle.name,
                            maxLines: 2,
                            minFontSize: 20,
                            maxFontSize: 35,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  // fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(
                            vehicle.id,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(),
                          ),
                          const Gap(Consts.padding),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(Consts.margin),
                const VehicleMileageIndicatorDetails(),
                const Gap(Consts.margin),
                const TotalDistanceTraveledInfo(),
                const Gap(Consts.margin * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalDistanceTraveledInfo extends StatelessWidget {
  const TotalDistanceTraveledInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MileageCubit, MileageState>(
      builder: (context, state) {
        final mileage = state.data?.mileage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (mileage == null)
                  Text(
                    '--',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          // letterSpacing: 0,
                        ),
                  )
                else
                  AnimatedCounterText(
                    finalValue: mileage,
                    duration: const Duration(seconds: 1),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          // letterSpacing: 0,
                        ),
                  ),
                const Gap(1),
                Text(
                  ' km',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        // letterSpacing: 0,
                      ),
                ),
              ],
            ),
            Text(
              'Kilometros recorridos',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  // fontSize: 25,
                  // fontWeight: FontWeight.w400,
                  // letterSpacing: 0,
                  ),
            ),
          ],
        );
      },
    );
  }
}

class VehicleMileageIndicatorDetails extends StatelessWidget {
  const VehicleMileageIndicatorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BlocBuilder<MileageCubit, MileageState>(
          builder: (context, state) {
            final status = state.status;
            final data = state.data;
            if (status.isInProgress) {
              return Column(
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      minHeight: 50,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const Spacer(),
                ],
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No hay datos del kilometraje',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        // fontSize: 30,
                        ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: LinearProgressIndicator(
                      value: 0,
                      minHeight: 50,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              );
            }

            final mileage = data.mileage;
            // const mileage = 2500;
            final percentage = mileage / 5000;
            final color = switch (percentage) {
              <= 0.33 => Colors.green,
              <= 0.66 => Colors.yellow,
              > 0.66 => Colors.red,
              _ => Colors.grey,
            };
            return Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: LinearProgressIndicator(
                            minHeight: 50,
                            value: percentage,
                            backgroundColor: Colors.grey.shade300,
                            color: color,
                          ),
                        ),
                      ),
                      const Gap(Consts.padding),
                      Text(
                        ' 5000 Km',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
