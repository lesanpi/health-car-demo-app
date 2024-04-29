import 'package:backend/db/database_connection.dart';
import 'package:backend/vehicle/vehicle_controller.dart';
import 'package:backend/vehicle/vehicle_data_source.dart';
import 'package:backend/vehicle/vehicle_repository.dart';

import 'package:dart_frog/dart_frog.dart';
import 'package:data_sources/data_sources.dart';
import 'package:dotenv/dotenv.dart';
import 'package:repository/repository.dart';

final env = DotEnv()..load(['variables.env']);
final _db = DatabaseConnection(dbUrl: env['DB_URL'] ?? '');
final _vehicleDs = VehicleDataSourceImpl(databaseConnection: _db);
final _vehicleRepo = VehicleRepositoryImpl(
  dataSource: _vehicleDs,
);
final _vehicleController = VehicleController(repository: _vehicleRepo);

Handler middleware(Handler handler) {
  return handler
      .use(provider<DatabaseConnection>((_) => _db))
      .use(provider<VehicleDataSource>((_) => _vehicleDs))
      .use(provider<VehicleRepository>((_) => _vehicleRepo))
      .use(provider<VehicleController>((_) => _vehicleController));
}
