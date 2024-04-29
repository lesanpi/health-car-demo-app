import 'package:backend/report_mileage/report_mileage_controller.dart';
import 'package:backend/report_mileage/report_mileage_repository.dart';

import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<ReportMileageController>(
      (context) => ReportMileageController(
        repository: ReportMileageRepositoryImpl(
          dataSource: context.read(),
          vehicleDataSource: context.read(),
        ),
      ),
    ),
  );
}
