// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verify_brackground_task_cubit.dart';

enum BackgroundPermissionStatus {
  unknown,
  denied,
  permantlyDenied,
  enabled,
}

class VerifyBrackgroundTaskState {
  const VerifyBrackgroundTaskState({
    this.isRunning = false,
    this.enabled = false,
    this.permissionStatus = BackgroundPermissionStatus.unknown,
  });
  final bool isRunning;
  final bool enabled;
  final BackgroundPermissionStatus permissionStatus;

  VerifyBrackgroundTaskState copyWith({
    bool? isRunning,
    bool? enabled,
    BackgroundPermissionStatus? permissionStatus,
  }) {
    return VerifyBrackgroundTaskState(
      isRunning: isRunning ?? this.isRunning,
      enabled: enabled ?? this.enabled,
      permissionStatus: permissionStatus ?? this.permissionStatus,
    );
  }
}
