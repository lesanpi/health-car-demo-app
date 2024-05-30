import 'dart:convert';
import 'dart:developer';

import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:health_car_demo_app/src/data/data_sources/vehicle_api/vehicle_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';
import 'package:models/src/vehicle/create_vehicle_dto.dart';
import 'package:models/src/vehicle/vehicle.dart';

class VehicleApi extends VehicleDataSource {
  VehicleApi({
    required String apiHost,
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _apiHost = apiHost;

  final http.Client _httpClient;
  final String _apiHost;

  @override
  Future<Vehicle> create(CreateVehicleDto data) {
    throw UnimplementedError();
  }

  @override
  Future<OperationResultDto> deleteVehicle(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Vehicle>> getAllVehicles() async {
    final uri = Uri.https(
      _apiHost,
      VehicleEndpoints.index,
    );
    http.Response response;
    try {
      log(
        '👷🏻 Get vehicles ',
        name: 'getAllVehicles()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response ${response.body}',
        name: 'getAllVehicles()',
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
            (e) => Vehicle.fromJson(
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
  Future<ReportMileage> getLastReportLocationOfVehicle(String vehicleId) async {
    final uri = Uri.https(
      _apiHost,
      '${VehicleEndpoints.vehicleLocationEndpoints}/$vehicleId',
    );
    http.Response response;
    try {
      log(
        '👷🏻 Loading last location of $vehicleId',
        name: 'getLastReportLocationOfVehicle()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response[${response.statusCode}] ${response.body}',
        name: 'getLastReportLocationOfVehicle()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200) {
      log(
        'Throwing HttpFailureException [${response.statusCode}]',
        name: 'getLastReportLocationOfVehicle()',
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
        name: 'getLastReportLocationOfVehicle()',
      );
      throw JsonDeserializationException();
    }
  }

  @override
  Future<Vehicle> getVehicleById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Vehicle> updateVehicle({
    required String id,
    required CreateVehicleDto data,
  }) {
    throw UnimplementedError();
  }
}
