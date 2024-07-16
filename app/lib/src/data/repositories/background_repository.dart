import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:health_car_demo_app/src/domain/repositories/repositories.dart';
import 'package:permission_handler/permission_handler.dart';

// The callback function should always be a top-level function.

class BackgroundRepository extends IBackgroundRepository {
  BackgroundRepository({required super.startCallback});

  String get name => runtimeType.toString();

  ReceivePort? _receivePort;

  void closeReceivePort() {
    _receivePort?.close();
    _receivePort = null;
  }

  bool registerReceivePort(ReceivePort? newReceivePort) {
    if (newReceivePort == null) {
      return false;
    }

    closeReceivePort();

    _receivePort = newReceivePort;
    _receivePort?.listen((data) {
      print('Receive port data $data');
    });

    return _receivePort != null;
  }

  @override
  Future<bool> start() async {
    final receivePort = FlutterForegroundTask.receivePort;
    final isRegistered = registerReceivePort(receivePort);
    log(
      'Init Starting service...',
      name: name,
    );
    if (await FlutterForegroundTask.isRunningService) {
      log(
        'Is not running service',
        name: name,
      );
      return FlutterForegroundTask.restartService();
    } else {
      log(
        'Starting service...',
        name: name,
      );
      final result = await FlutterForegroundTask.startService(
        notificationTitle: 'Foreground Service is running',
        notificationText: 'Tap to return to the app',
        callback: startCallback,
      );
      log(
        'Starting service result ${result ? '✅' : '❌'}...',
        name: name,
      );
      return result;
    }
  }

  @override
  Future<void> initService() async {
    log(
      'Initializing service task',
      name: name,
    );
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        id: 500,
        // foregroundServiceType: AndroidForegroundServiceType.CONNECTED_DEVICE,
        foregroundServiceType: AndroidForegroundServiceType.LOCATION,
        channelId: 'foreground_service',
        channelName: 'Foreground Service Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: const ForegroundTaskOptions(
        // interval: 30000,
        autoRunOnBoot: true,
        allowWifiLock: true,
      ),
    );
    log(
      'Initialized',
      name: name,
    );
  }

  @override
  Future<bool> isBackgroundProcessRunning() {
    return FlutterForegroundTask.isRunningService;
  }

  @override
  Future<bool> isEnabled() async {
    final locationWhenInUse = await Permission.locationWhenInUse.status;
    final locationAlways = await Permission.locationAlways.status;
    final bluetoothStatus = Platform.isIOS
        ? await Permission.bluetooth.status
        : PermissionStatus.granted;
    final bluetoothScanStatus = Platform.isIOS
        ? PermissionStatus.granted
        : await Permission.bluetoothScan.status;
    final bluetoothConnectStatus = Platform.isIOS
        ? PermissionStatus.granted
        : await Permission.bluetoothConnect.status;
    // final postNotificationStatus = await Permission.systemAlertWindow
    final status = await FlutterForegroundTask.checkNotificationPermission();
    log('locationWhenInUse: $locationWhenInUse ', name: 'BackgroundRepository');
    log('locationAlways: $locationAlways ', name: 'BackgroundRepository');
    log('bluetoothStatus: $bluetoothStatus ', name: 'BackgroundRepository');
    log(
      'bluetoothScanStatus: $bluetoothScanStatus ',
      name: 'BackgroundRepository',
    );
    log(
      'bluetoothConnectStatus: $bluetoothConnectStatus ',
      name: 'BackgroundRepository',
    );
    log(
      'ForegorundTask Status: $status ',
      name: 'BackgroundRepository',
    );

    return bluetoothStatus.isGranted &&
        bluetoothScanStatus.isGranted &&
        bluetoothConnectStatus.isGranted &&
        locationAlways.isGranted &&
        status == NotificationPermission.granted;
  }

  @override
  Future<void> requestPermissions() async {
    final bluetoothStatus = Platform.isIOS
        ? await Permission.bluetooth.request()
        : PermissionStatus.granted;
    final bluetoothScanStatus = Platform.isIOS
        ? PermissionStatus.granted
        : await Permission.bluetoothScan.request();
    final bluetoothConnectStatus = Platform.isIOS
        ? PermissionStatus.granted
        : await Permission.bluetoothConnect.request();
    final locationWhenUse = await Permission.locationWhenInUse.request();
    final locationAlways = await Permission.locationAlways.request();
    final location = await Permission.location.request();
    final alertStatus = await Permission.systemAlertWindow.request();
    final batteryStatus = await Permission.ignoreBatteryOptimizations.request();

    if (bluetoothConnectStatus.isPermanentlyDenied ||
        locationAlways.isPermanentlyDenied ||
        location.isPermanentlyDenied ||
        locationWhenUse.isPermanentlyDenied ||
        bluetoothStatus.isPermanentlyDenied ||
        bluetoothScanStatus.isPermanentlyDenied ||
        alertStatus.isPermanentlyDenied ||
        batteryStatus.isPermanentlyDenied) {
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
