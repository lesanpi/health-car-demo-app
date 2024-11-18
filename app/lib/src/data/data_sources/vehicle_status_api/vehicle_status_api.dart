import 'dart:convert';
import 'dart:developer';

import 'package:data_sources/data_sources.dart';
import 'package:exceptions/exceptions.dart';
import 'package:health_car_demo_app/src/data/data_sources/report_mileage_api/report_mileage_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:models/src/operation_result/operation_result_dto.dart';
import 'package:models/src/report_mileage/create_report_dto.dart';
import 'package:models/src/report_mileage/report_mileage.dart';
import 'package:models/src/vehicle_status/create_vehicle_status_dto.dart';
import 'package:models/src/vehicle_status/vehicle_status.dart';

import 'package:health_car_demo_app/src/data/data_sources/vehicle_status_api/vehicle_status_endpoints.dart';

class VehicleStatusApi extends VehicleStatusDataSource {
  VehicleStatusApi({
    required String apiHost,
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _apiHost = apiHost;

  final http.Client _httpClient;
  final String _apiHost;

  @override
  Future<VehicleStatus> create(CreateVehicleStatusDto data) async {
    final uri = Uri.https(
      _apiHost,
      VehicleStatusEndpoints.index,
    );
    http.Response response;
    try {
      log(
        '👷🏻 Create vehicle status $data Km for vehicle ${data.vehicle} ${jsonEncode(data.toJson())}',
        name: 'createVehicleStatus()',
      );

      response = await _httpClient.post(
        uri,
        body: json.encode(data.toJson()),
      );
      log(
        'Response[${response.statusCode}] ${response.body}',
        name: 'createVehicleStatus()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      return VehicleStatus.fromJson(responseBody);
    } catch (e, s) {
      log(
        'Error JsonDeserializationException',
        error: e,
        stackTrace: s,
        name: 'createVehicleStatus()',
      );
      throw JsonDeserializationException();
    }
  }

  @override
  Future<OperationResultDto> deleteVehicleStatus(String id) {
    // TODO: implement deleteVehicleStatus
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleStatus>> getAllVehicleStatusesByVehicle(String vehicle) {
    // TODO: implement getAllVehicleStatusesByVehicle
    throw UnimplementedError();
  }

  @override
  Future<VehicleStatus> getLastVehicleStatus(String vehicleId) async {
    final uri = Uri.https(
      _apiHost,
      '${VehicleStatusEndpoints.index}/$vehicleId',
    );
    http.Response response;
    try {
      log(
        '👷🏻 Loading last vehicle status of $vehicleId',
        name: 'getLastVehicleStatus()',
      );

      response = await _httpClient.get(
        uri,
      );
      log(
        'Response[${response.statusCode}] ${response.body}',
        name: 'getLastVehicleStatus()',
      );
    } catch (_) {
      throw InternalServerException('');
    }

    if (response.statusCode != 200) {
      log(
        'Throwing HttpFailureException [${response.statusCode}]',
        name: 'getLastVehicleStatus()',
      );
      throw HttpFailureException('', response.statusCode);
    }
    try {
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      return VehicleStatus.fromJson(responseBody);
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
  Future<VehicleStatus> getVehicleStatusById(String id) {
    // TODO: implement getVehicleStatusById
    throw UnimplementedError();
  }
}
