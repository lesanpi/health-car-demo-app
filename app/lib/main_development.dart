import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:health_car_demo_app/app/app.dart';
import 'package:health_car_demo_app/bootstrap.dart';
import 'package:health_car_demo_app/src/domain/use_cases/background_use_case.dart';

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

void main() => runApp(
      const App(
        startCallback: startCallback,
        apiHost: 'healt-car-api-w59q1bv-lesanpi.globeapp.dev',
      ),
    );
