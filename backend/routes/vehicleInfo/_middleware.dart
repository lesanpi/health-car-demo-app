import 'package:backend/vehicle_status/vehicle_status_controller.dart';
import 'package:backend/vehicle_status/vehicle_status_repository.dart';

import 'package:dart_frog/dart_frog.dart';
import 'package:data_sources/data_sources.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<VehicleStatusController>(
      (context) {
        return VehicleStatusController(
          repository: VehicleStatusRepositoryImpl(
            dataSource: context.read(),
          ),
        );
      },
    ),
  );
}
