import 'package:backend/vehicle/vehicle_controller.dart';
import 'package:backend/vehicle/vehicle_repository.dart';

import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<VehicleController>(
      (context) => VehicleController(
        repository: VehicleRepositoryImpl(
          dataSource: context.read(),
        ),
      ),
    ),
  );
}
