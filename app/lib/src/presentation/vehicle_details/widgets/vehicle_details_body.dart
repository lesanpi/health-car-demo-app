import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/animated_counter_text.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';

import 'package:health_car_demo_app/src/presentation/vehicle_details/widgets/vehicle_mileage_indicator.dart';

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
    return Column(
      children: [
        const Gap(Consts.margin),
        AspectRatio(
          aspectRatio: 16 / 10,
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
                  padding: const EdgeInsets.symmetric(horizontal: Consts.margin)
                      .copyWith(left: Consts.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        vehicle.name,
                        maxLines: 2,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                ),
                      ),
                      Text(
                        vehicle.id,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(),
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
      ],
    );
    // return BlocBuilder<VehicleDetailsBloc, VehicleDetailsState>(
    //   builder: (context, state) {
    //     return Center(child: Text(state.customProperty));
    //   },
    // );
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
