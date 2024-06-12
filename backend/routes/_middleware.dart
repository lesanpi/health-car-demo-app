import 'package:backend/db/database_connection.dart';
import 'package:backend/report_mileage/report_mileage_data_source.dart';
import 'package:backend/vehicle/vehicle_data_source.dart';
import 'package:backend/vehicle_status/vehicle_status_data_source.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:data_sources/data_sources.dart';

Handler middleware(Handler handler) {
  return handler
      .use(
        provider<ReportMileageDataSource>(
          (context) {
            final reportMileageDataSourceImpl = ReportMileageDataSourceImpl(
              databaseConnection: context.read<DatabaseConnection>(),
            );
            return reportMileageDataSourceImpl;
          },
        ),
      )
      .use(
        provider<VehicleDataSource>(
          (context) => VehicleDataSourceImpl(
            databaseConnection: context.read<DatabaseConnection>(),
          ),
        ),
      )
      .use(
        provider<VehicleStatusDataSource>(
          (context) => VehicleStatusDataSourceImpl(
            databaseConnection: context.read<DatabaseConnection>(),
          ),
        ),
      );
  // .use(requestLogger())
  // .use(provider<DatabaseConnection>((_) => _db));
}
