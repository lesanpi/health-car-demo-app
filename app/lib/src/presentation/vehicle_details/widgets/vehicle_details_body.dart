import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/animated_counter_text.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/vehicle_stats.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/vehicle_mileage_indicator.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

/// {@template vehicle_details_body}
/// Body of the VehicleDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class VehicleDetailsBody extends StatelessWidget {
  /// {@macro vehicle_details_body}
  const VehicleDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicle = context.select((VehicleDetailsBloc bloc) => bloc.vehicle);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(Consts.margin),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  // bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.width,
                  right: MediaQuery.of(context).size.width * 3.85 / 8,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.network(
                      vehicle.photo,
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
                ),
                Positioned(
                  top: Consts.margin,
                  // bottom: 0,
                  left: MediaQuery.of(context).size.width * 4.25 / 8,
                  right: 0,
                  // width: MediaQuery.of(context).size.width * 4.25 / 8,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Consts.margin)
                            .copyWith(left: Consts.padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          vehicle.name,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontSize: 35,
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
                        const Gap(Consts.margin),
                        const TotalDistanceTraveledInfo(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const Gap(Consts.margin),
          const VehicleMileageIndicator(),
          // const Gap(Consts.padding / 2),
          const VehicleStatusCards(),
        ],
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

class VehicleStatusCards extends StatelessWidget {
  const VehicleStatusCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Consts.margin,
      ),
      child: BlocBuilder<VehicleDetailsBloc, VehicleDetailsState>(
        builder: (context, state) {
          final data = state.data;
          final coolantTemperature = data?.coolantTemperature;
          final oilTemperature = data?.oilTemperature;
          final checkEngine = data?.milOn;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⚙️ Estado de mi vehículo',
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const Gap(Consts.margin),
              Row(
                children: [
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.teal.shade50,
                      title: data == null
                          ? '--'
                          : timeago.format(
                              data.createdAt,
                              locale: 'en_short',
                            ),
                      description: 'Ult. vez',
                      icon: const Icon(
                        FluentSystemIcons.ic_fluent_clock_filled,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.orange.shade50,
                      title: coolantTemperature == null
                          ? '-- °C'
                          : '$coolantTemperature °C',
                      description: 'Temperatura refrigerante',
                      icon: const Icon(
                        // Icons.thermostat,
                        FluentSystemIcons.ic_fluent_temperature_filled,

                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.amber.shade50,
                      description: checkEngine == null
                          ? '--'
                          : checkEngine
                              ? 'Encendido'
                              : 'Apagado',
                      title: 'Check Engine',
                      icon: const Icon(
                        // Icons.car_crash,
                        FluentSystemIcons.ic_fluent_report_warning_filled,

                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.red.shade50,
                      title: data == null
                          ? '--'
                          : timeago.format(
                              data.createdAt,
                              locale: 'en_short',
                            ),
                      description: 'Ult. vez',
                      icon: const Icon(
                        FluentSystemIcons.ic_fluent_clock_filled,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.blue.shade50,
                      title: oilTemperature == null
                          ? '-- °C'
                          : '$oilTemperature °C',
                      description: 'Temperatura aceite',
                      icon: const Icon(
                        // Icons.thermostat,
                        FluentSystemIcons.ic_fluent_settings_dev_filled,

                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SimpleStatCard(
                      color: Colors.amber.shade50,
                      description: checkEngine == null
                          ? '--'
                          : checkEngine
                              ? 'Encendido'
                              : 'Apagado',
                      title: 'Check Engine',
                      icon: const Icon(
                        // Icons.car_crash,
                        FluentSystemIcons.ic_fluent_report_warning_filled,

                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
