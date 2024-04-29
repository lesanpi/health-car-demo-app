import 'package:backend/db/database_connection.dart';
import 'package:backend/report_mileage/report_mileage_controller.dart';
import 'package:backend/report_mileage/report_mileage_data_source.dart';
import 'package:backend/report_mileage/report_mileage_repository.dart';
import 'package:backend/vehicle/vehicle_data_source.dart';
import 'package:backend/vehicle/vehicle_repository.dart';

import 'package:dart_frog/dart_frog.dart';
import 'package:data_sources/data_sources.dart';
import 'package:dotenv/dotenv.dart';
import 'package:repository/repository.dart';

final env = DotEnv()..load(['variables.env']);
final _db = DatabaseConnection(dbUrl: env['DB_URL'] ?? '');
final _vehicleDs = VehicleDataSourceImpl(databaseConnection: _db);
final _reportMileageDs = ReportMileageDataSourceImpl(databaseConnection: _db);
final _reportMileageRepository = ReportMileageRepositoryImpl(
  dataSource: _reportMileageDs,
  vehicleDataSource: _vehicleDs,
);
final _reportMileageController =
    ReportMileageController(repository: _reportMileageRepository);

Handler middleware(Handler handler) {
  return handler
      .use(provider<DatabaseConnection>((_) => _db))
      .use(provider<ReportMileageDataSource>((_) => _reportMileageDs))
      .use(provider<ReportMileageRepository>((_) => _reportMileageRepository))
      .use(provider<ReportMileageController>((_) => _reportMileageController));
}
