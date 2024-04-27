import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_car_demo_app/app/theme.dart';
import 'package:health_car_demo_app/l10n/l10n.dart';
import 'package:health_car_demo_app/src/data/repositories/background_repository.dart';
import 'package:health_car_demo_app/src/domain/repositories/background_repository.dart';
import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';
import 'package:health_car_demo_app/src/presentation/home/home.dart';

@pragma('vm:entry-point')
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(BackgroundTaskHandler());
}

class BackgroundTaskHandler extends TaskHandler {
  SendPort? _sendPort;

  // Called when the task is started.
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;
  }

  // Called every [interval] milliseconds in [ForegroundTaskOptions].
  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    await BackgroundUseCase.executeBackgroundProcess();
  }

  @override
  void onDestroy(DateTime timestamp, SendPort? sendPort) {
    log('onDestroy', name: 'BackgroundTaskHandler');
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundRepository =
        BackgroundRepository(startCallback: startCallback);
    return RepositoryProvider<IBackgroundRepository>(
      create: (context) {
        return backgroundRepository;
      },
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
