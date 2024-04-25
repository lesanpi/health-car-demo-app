import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:health_car_demo_app/src/domain/repositories/repositories.dart';
import 'package:permission_handler/permission_handler.dart';

class BackgroundRepository extends IBackgroundRepository {
  @override
  Future<void> initService() {
    // TODO: implement initService
    throw UnimplementedError();
  }

  @override
  Future<bool> isEnabled() async {
    final bluetoothStatus = await Permission.bluetooth.request();
    final bluetoothScanStatus = await Permission.bluetoothScan.request();
    final bluetoothConnectStatus = await Permission.bluetoothConnect.request();
    final status = await FlutterForegroundTask.checkNotificationPermission();
    return bluetoothStatus.isGranted &&
        bluetoothScanStatus.isGranted &&
        bluetoothConnectStatus.isGranted &&
        status == NotificationPermission.granted;
  }

  @override
  Future<void> requestPermissions() async {
    final bluetoothStatus = await Permission.bluetooth.request();
    final bluetoothScanStatus = await Permission.bluetoothScan.request();
    final bluetoothConnectStatus = await Permission.bluetoothConnect.request();

    if (bluetoothConnectStatus.isPermanentlyDenied ||
        bluetoothStatus.isPermanentlyDenied ||
        bluetoothScanStatus.isPermanentlyDenied) {
      await openAppSettings();
    }
    if (!Platform.isAndroid) {
      return;
    }

    // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
    // onNotificationPressed function to be called.
    //
    // When the notification is pressed while permission is denied,
    // the onNotificationPressed function is not called and the app opens.
    //
    // If you do not use the onNotificationPressed or launchApp function,
    // you do not need to write this code.
    if (!await FlutterForegroundTask.canDrawOverlays) {
      // This function requires `android.permission.SYSTEM_ALERT_WINDOW`
      // permission.
      await FlutterForegroundTask.openSystemAlertWindowSettings();
    }

    // Android 12 or higher, there are restrictions on
    // starting a foreground service.
    //
    // To restart the service on device reboot or unexpected problem,
    // you need to allow below permission.
    if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      // This function requires
      //`android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
      await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    }

    // Android 13 and higher, you need to allow notification permission
    // to expose foreground service notification.
    final notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermissionStatus != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }
  }
}
