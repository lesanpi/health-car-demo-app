import 'package:backend/controller/mapObjectId.dart';
import 'package:backend/db/database_connection.dart';
import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/models.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:exceptions/exceptions.dart';

/// {@template vehicle_data_source_impl}
/// Vehicle data source implementation for backend
/// {@endtemplate}
class VehicleDataSourceImpl extends VehicleDataSource {
  /// {@macro vehicle_data_source_impl}
  VehicleDataSourceImpl({
    required DatabaseConnection databaseConnection,
  }) : _databaseConnection = databaseConnection;
  final DatabaseConnection _databaseConnection;

  @override
  Future<Vehicle> create(CreateVehicleDto data) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicles');

      final result = await collection.insertOne({
        ...data.toJson(),
      });
      final vehicleDocument = result.document ?? {};
      final id = mapObjectId<String>(vehicleDocument['_id']);
      if (id.isLeft) {
        throw InternalServerException('Unexpected error: ${id.left.message}');
      }
      vehicleDocument['_id'] = id.right;
      return Vehicle.fromJson(vehicleDocument);
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      // await _databaseConnection.close();
    }
  }

  @override
  Future<OperationResultDto> deleteVehicle(String id) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicles');
      final result =
          await collection.deleteOne(where.id(ObjectId.fromHexString(id)));
      return OperationResultDto(
        success: result.success,
        message: result.errmsg,
      );
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      // await _databaseConnection.close();
    }
  }

  @override
  Future<List<Vehicle>> getAllVehicles() async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicles');
      final result = await collection.find().toList();

      final vehicles = result.map((tagDocument) {
        print(tagDocument);
        final id = mapObjectId<String>(tagDocument['_id']);
        if (id.isLeft) {
          throw InternalServerException('Unexpected error: ${id.left.message}');
        }
        tagDocument['_id'] = id.right;
        return Vehicle.fromJson(tagDocument);
      }).toList();
      return vehicles;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      // await _databaseConnection.close();
    }
  }

  @override
  Future<Vehicle> getVehicleById(String id) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicles');
      final result =
          await collection.findOne(where.id(ObjectId.fromHexString(id)));
      final document = result ?? {};

      if (document.isEmpty) {
        throw NotFoundException(
          'Not found vehicle $id',
        );
      }

      final vehicleId = mapObjectId<String>(document['_id']);
      if (vehicleId.isLeft) {
        throw InternalServerException(
          'Unexpected error: ${vehicleId.left.message}',
        );
      }
      document['_id'] = vehicleId.right;

      final user = Vehicle.fromJson(document);
      return user;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      // await _databaseConnection.close();
    }
  }

  @override
  Future<Vehicle> updateVehicle({
    required String id,
    required CreateVehicleDto data,
  }) {
    // TODO: implement updateVehicle
    throw UnimplementedError();
  }

  @override
  Future<ReportMileage> getLastReportOfVehicle(String vehicleId) async {
    try {
      final collection = _databaseConnection.db.collection('reportMileage');

      final result = await collection
          .findOne(where.eq('vehicle', vehicleId).sortBy('createdAt'));
      final document = result ?? {};

      if (document.isEmpty) {
        throw NotFoundException(
          'Not found report for $vehicleId',
        );
      }

      final reportId = mapObjectId<String>(document['_id']);
      if (reportId.isLeft) {
        throw InternalServerException(
          'Unexpected error: ${reportId.left.message}',
        );
      }
      document['_id'] = reportId.right;

      final report = ReportMileage.fromJson(document);
      return report;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');

      // await _databaseConnection.close();
    }
  }
}
