import 'package:backend/controller/mapObjectId.dart';
import 'package:backend/db/database_connection.dart';
import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/models.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// {@template report_mileage_data_source}
/// Report Mileage data source implementation for backend
/// {@endtemplate}
class ReportMileageDataSourceImpl extends ReportMileageDataSource {
  /// {@macro vehicle_data_source_impl}
  ReportMileageDataSourceImpl({
    required DatabaseConnection databaseConnection,
  }) : _databaseConnection = databaseConnection;
  final DatabaseConnection _databaseConnection;

  @override
  Future<OperationResultDto> deleteReport(String id) async {
    try {
      final collection = _databaseConnection.db.collection('reportMileage');
      final result =
          await collection.deleteOne(where.id(ObjectId.fromHexString(id)));

      return OperationResultDto(
        success: result.success,
        message: result.errmsg,
      );
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    }
  }

  @override
  Future<List<ReportMileage>> getAllReports() async {
    try {
      final collection = _databaseConnection.db.collection('reportMileage');
      final result = await collection.find().toList();

      final reports = result.map((tagDocument) {
        final id = mapObjectId<String>(tagDocument['_id']);
        if (id.isLeft) {
          throw InternalServerException('Unexpected error: ${id.left.message}');
        }
        tagDocument['_id'] = id.right;
        return ReportMileage.fromJson(tagDocument);
      }).toList();
      return reports;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    }
  }

  @override
  Future<List<ReportMileage>> getAllReportsByVehicle(String vehicleId) async {
    try {
      final collection = _databaseConnection.db.collection('reportMileage');
      final result = await collection
          .find(where.eq('vehicle', vehicleId).sortBy('createdAt'))
          .toList();

      final reports = result.map((tagDocument) {
        final id = mapObjectId<String>(tagDocument['_id']);
        if (id.isLeft) {
          throw InternalServerException('Unexpected error: ${id.left.message}');
        }
        tagDocument['_id'] = id.right;
        return ReportMileage.fromJson(tagDocument);
      }).toList();
      return reports;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    }
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

  @override
  Future<ReportMileage> getReportById(String id) async {
    try {
      await _databaseConnection.connect();
      final collection = _databaseConnection.db.collection('reportMileage');
      final result =
          await collection.findOne(where.id(ObjectId.fromHexString(id)));
      final document = result ?? {};

      if (document.isEmpty) {
        throw NotFoundException(
          'Not found report $id',
        );
      }

      final vehicleId = mapObjectId<String>(document['_id']);
      if (vehicleId.isLeft) {
        throw InternalServerException(
          'Unexpected error: ${vehicleId.left.message}',
        );
      }
      document['_id'] = vehicleId.right;

      final report = ReportMileage.fromJson(document);
      return report;
    } on HttpException {
      rethrow;
    } catch (e) {
      throw InternalServerException('Unexpected error: $e');
    } finally {
      // await _databaseConnection.close();
    }
  }
}
