// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'background_process_bloc.dart';

/// {@template home_state}
/// HomeState description
/// {@endtemplate}
class BackgroundProcessState extends Equatable {
  /// {@macro home_state}
  const BackgroundProcessState({
    this.customProperty = 'Default Value',
    this.initializedService = false,
  });

  /// A description for customProperty
  final String customProperty;

  final bool initializedService;

  @override
  List<Object> get props => [customProperty, initializedService];

  /// Creates a copy of the current HomeState with property changes
  BackgroundProcessState copyWith({
    String? customProperty,
    bool? initializedService,
  }) {
    return BackgroundProcessState(
      customProperty: customProperty ?? this.customProperty,
      initializedService: initializedService ?? this.initializedService,
    );
  }
}

/// {@template home_initial}
/// The initial state of HomeState
/// {@endtemplate}
class HomeInitial extends BackgroundProcessState {
  /// {@macro home_initial}
  const HomeInitial() : super();
}
