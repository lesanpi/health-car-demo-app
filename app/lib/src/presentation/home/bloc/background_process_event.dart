part of 'background_process_bloc.dart';

abstract class BackgroundProcessEvent extends Equatable {
  const BackgroundProcessEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_home_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomHomeEvent extends BackgroundProcessEvent {
  /// {@macro custom_home_event}
  const CustomHomeEvent();
}

class RequestPermissionPressed extends BackgroundProcessEvent {
  /// {@macro custom_home_event}
  const RequestPermissionPressed();
}

class BackgroundProcessStarted extends BackgroundProcessEvent {
  /// {@macro custom_home_event}
  const BackgroundProcessStarted();
}
