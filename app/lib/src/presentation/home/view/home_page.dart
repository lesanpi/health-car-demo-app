import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_foreground_task/ui/with_foreground_task.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/main_development.dart';
import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';
import 'package:health_car_demo_app/src/domain/use_cases/vehicles_use_case.dart';
import 'package:health_car_demo_app/src/presentation/home/cubit/verify_brackground_task_cubit.dart';
import 'package:health_car_demo_app/src/presentation/home/widgets/home_body.dart';
import 'package:health_car_demo_app/src/presentation/home/widgets/permission_request_view.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/vehicles.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehiclesCubit(
            VehiclesUseCase(
              vehicleRepository: context.read(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => VerifyBrackgroundTaskCubit(
            BackgroundUseCase(backgroundRepository: context.read()),
          ),
        ),
      ],
      child: WithForegroundTask(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: const Text(
              'Health Car',
              style: TextStyle(
                fontSize: 38,
              ),
            ),
            titleSpacing: Consts.margin * 1.5,
            centerTitle: false,
          ),
          backgroundColor: Colors.white,
          body: const HomeView(),
        ),
      ),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyBrackgroundTaskCubit, VerifyBrackgroundTaskState>(
      listener: (context, state) {
        final enabled = state.enabled;
        if (!enabled) {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) {
              return const PermissionRequestView();
            },
          );
        }
      },
      child: const HomeBody(),
    );
  }
}
