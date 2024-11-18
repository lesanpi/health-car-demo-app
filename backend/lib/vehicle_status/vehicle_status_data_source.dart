import 'package:backend/controller/mapObjectId.dart';
import 'package:backend/db/database_connection.dart';
import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';
import 'package:models/src/vehicle_status/create_vehicle_status_dto.dart';
import 'package:models/src/vehicle_status/vehicle_status.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// {@template vehicle_status_data_source_impl}
/// Vehicle status data source implementation
/// {@endtemplate}
class VehicleStatusDataSourceImpl extends VehicleStatusDataSource {
  /// {@macro vehicle_status_data_source_impl}
  VehicleStatusDataSourceImpl({
    required DatabaseConnection databaseConnection,
  }) : _databaseConnection = databaseConnection;
  final DatabaseConnection _databaseConnection;

  @override
  Future<VehicleStatus> create(CreateVehicleStatusDto data) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicleStatus');

      final result = await collection.insertOne({
        ...data.toJson(),
        'createdAt': DateTime.now().toUtc().toIso8601String(),
      });
      final vehicleDocument = result.document ?? {};
      final id = mapObjectId<String>(vehicleDocument['_id']);
      if (id.isLeft) {
        throw InternalServerException('Unexpected error: ${id.left.message}');
      }
      vehicleDocument['_id'] = id.right;
      return VehicleStatus.fromJson(vehicleDocument);
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<OperationResultDto> deleteVehicleStatus(String id) async {
    try {
      await _databaseConnection.connect();

      final collection = _databaseConnection.db.collection('vehicleStatus');
      final result =
          await collection.deleteOne(where.id(ObjectId.fromHexString(id)));
      return OperationResultDto(
        success: result.success,
        message: result.errmsg,
      );
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<List<VehicleStatus>> getAllVehicleStatusesByVehicle(
    String vehicle,
  ) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicleStatus');
      final result = await collection
          .find(
            where.eq('vehicle', vehicle).sortBy(
                  'createdAt',
                  descending: true,
                ),
          )
          .toList();

      final statuses = result.map((tagDocument) {
        final id = mapObjectId<String>(tagDocument['_id']);
        if (id.isLeft) {
          throw InternalServerException('Unexpected error: ${id.left.message}');
        }
        tagDocument['_id'] = id.right;
        return VehicleStatus.fromJson(tagDocument);
      }).toList();
      return statuses;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<VehicleStatus> getLastVehicleStatus(String vehicleId) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicleStatus');
      final result = await collection.findOne(
        where.eq('vehicle', vehicleId).sortBy(
              'createdAt',
              descending: true,
            ),
      );

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

      final report = VehicleStatus.fromJson(document);
      return report;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<VehicleStatus> getVehicleStatusById(String id) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('vehicleStatus');
      final result =
          await collection.findOne(where.id(ObjectId.fromHexString(id)));
      final document = result ?? {};

      if (document.isEmpty) {
        throw NotFoundException(
          'Not found vehicle $id',
        );
      }

      final vehicleStatusId = mapObjectId<String>(document['_id']);
      if (vehicleStatusId.isLeft) {
        throw InternalServerException(
          'Unexpected error: ${vehicleStatusId.left.message}',
        );
      }
      document['_id'] = vehicleStatusId.right;

      final vehiceStatus = VehicleStatus.fromJson(document);
      return vehiceStatus;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      await _databaseConnection.close();
    }
  }
}
