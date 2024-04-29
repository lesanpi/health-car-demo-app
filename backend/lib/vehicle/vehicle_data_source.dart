import 'package:backend/db/database_connection.dart';
import 'package:data_sources/data_sources.dart';
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/vehicle/create_vehicle_dto.dart';
import 'package:models/src/vehicle/vehicle.dart';

class VehicleDataSourceImpl extends VehicleDataSource {
  VehicleDataSourceImpl({
    required DatabaseConnection databaseConnection,
  }) : _databaseConnection = databaseConnection;
  final DatabaseConnection _databaseConnection;

  @override
  Future<Vehicle> create(CreateVehicleDto data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<OperationResultDto> deleteVehicle(String id) {
    // TODO: implement deleteVehicle
    throw UnimplementedError();
  }

  @override
  Future<List<Vehicle>> getAllVehicles() {
    // TODO: implement getAllVehicles
    throw UnimplementedError();
  }

  @override
  Future<Vehicle> getVehicleById(String id) {
    // TODO: implement getVehicleById
    throw UnimplementedError();
  }

  @override
  Future<Vehicle> updateVehicle({
    required String id,
    required CreateVehicleDto data,
  }) {
    // TODO: implement updateVehicle
    throw UnimplementedError();
  }
}
