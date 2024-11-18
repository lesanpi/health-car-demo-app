import 'dart:convert';
import 'dart:developer';

import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:health_car_demo_app/src/data/data_sources/report_mileage_api/report_mileage_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/report_mileage/create_report_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';

class ReportMileageApi extends ReportMileageDataSource {
  ReportMileageApi({
    required String apiHost,
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _apiHost = apiHost;

  final http.Client _httpClient;
  final String _apiHost;

  @override
  Future<ReportMileage> createReport(CreateReportDto data) async {
    final uri = Uri.https(
      _apiHost,
      ReportMileageEndpoints.reportsEndpoints,
    );
    http.Response response;
    try {
      log(
        '👷🏻 Create report with mileage ${data.toJson()} Km for vehicle ${data.vehicle} $uri',
        name: 'createReport()',
      );

      response = await _httpClient.post(
        uri,
        body: json.encode(data.toJson()),
      );
      log(
        'Response[${response.statusCode}] ${response.body}',
        name: 'createReport()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      return ReportMileage.fromJson(responseBody);
    } catch (e, s) {
      log(
        'Error JsonDeserializationException',
        error: e,
        stackTrace: s,
      );
      throw JsonDeserializationException();
    }
  }

  @override
  Future<OperationResultDto> deleteReport(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<ReportMileage>> getAllReports() => getAllReportsByVehicle('');

  @override
  Future<List<ReportMileage>> getAllReportsByVehicle(String vehicleId) async {
    final uri = Uri.https(
      _apiHost,
      ReportMileageEndpoints.reportsEndpoints,
    ).replace(
      queryParameters: {
        if (vehicleId.isNotEmpty) 'vehicle': vehicleId,
      },
    );
    http.Response response;
    try {
      log(
        '👷🏻 Get reports using vehicle $vehicleId ',
        name: 'getReports()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response ${response.body}',
        name: 'getReports()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200) {
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as List;
      return responseBody
          .map(
            (e) => ReportMileage.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e, s) {
      log(
        'Error JsonDeserializationException',
        error: e,
        stackTrace: s,
      );
      throw JsonDeserializationException();
    }
  }

  @override
  Future<ReportMileage> getLastReportOfVehicle(String vehicleId) async {
    final uri = Uri.https(
      _apiHost,
      '${ReportMileageEndpoints.vehicleStatusEndpoints}/$vehicleId',
    );
    http.Response response;
    try {
      log(
        '👷🏻 Loading last report of $vehicleId',
        name: 'getLastReportOfVehicle()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response[${response.statusCode}] ${response.body}',
        name: 'getLastReportOfVehicle()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200) {
      log(
        'Throwing HttpFailureException [${response.statusCode}]',
        name: 'getLastReportOfVehicle()',
      );
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      return ReportMileage.fromJson(responseBody);
    } catch (e, s) {
      log(
        'Error JsonDeserializationException',
        error: e,
        stackTrace: s,
      );
      throw JsonDeserializationException();
    }
  }

  @override
  Future<ReportMileage> getReportById(String id) async {
    final uri = Uri.https(
      _apiHost,
      ReportMileageEndpoints.vehicleStatusEndpoints,
    );
    http.Response response;
    try {
      log(
        '👷🏻 Loading report  $id',
        name: 'getReportById()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response ${response.body}',
        name: 'getReportById()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200) {
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      return ReportMileage.fromJson(responseBody);
    } catch (e, s) {
      log(
        'Error JsonDeserializationException',
        error: e,
        stackTrace: s,
      );
      throw JsonDeserializationException();
    }
  }
}
