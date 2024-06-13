import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_details/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/cubit/mileage_cubit.dart';

class VehicleMileageIndicator extends StatelessWidget {
  const VehicleMileageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
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
      ),
    );
  }
}
