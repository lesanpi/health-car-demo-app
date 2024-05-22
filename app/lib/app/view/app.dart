import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_car_demo_app/app/theme.dart';
import 'package:health_car_demo_app/l10n/l10n.dart';
import 'package:health_car_demo_app/src/data/data_sources/geolocation/gelocation_api_plugin.dart';
import 'package:health_car_demo_app/src/data/data_sources/report_mileage_api/report_mileage_api.dart';
import 'package:health_car_demo_app/src/data/data_sources/vehicle_api/vehicle_api.dart';
import 'package:health_car_demo_app/src/data/repositories/background_repository.dart';
import 'package:health_car_demo_app/src/data/repositories/vehicle_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/background_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/geolocation_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/vehicle_repository.dart';
import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';
import 'package:health_car_demo_app/src/presentation/home/home.dart';

class App extends StatelessWidget {
  const App({
    required this.apiHost,
    super.key,
    this.startCallback,
  });
  final String apiHost;
  final Function? startCallback;

  @override
  Widget build(BuildContext context) {
    final backgroundRepository = BackgroundRepository(
      startCallback: startCallback,
    );
    final vehicleRepository = VehicleRepository(
      apiReports: ReportMileageApi(apiHost: apiHost),
      apiVehicle: VehicleApi(apiHost: apiHost),
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IGeolocationRepository>(
          create: (_) => GeolocationRepository(
            geolocationApi: GeolocationApiPlugin(),
          ),
        ),
        RepositoryProvider<IBackgroundRepository>(
          create: (context) {
            return backgroundRepository;
          },
        ),
        RepositoryProvider<IVehicleRepository>(
          create: (context) {
            return vehicleRepository;
          },
        ),
      ],
      child: BlocProvider(
        create: (context) => BackgroundProcessBloc(
          BackgroundUseCase(backgroundRepository: backgroundRepository),
        ),
        child: MaterialApp(
          theme: AppTheme.theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),
      ),
    );
  }
}
