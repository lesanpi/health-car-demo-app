import 'dart:async';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

class VehicleStatusController extends HttpController {
  VehicleStatusController({
    required VehicleStatusRepository repository,
  }) : _repository = repository;
  final VehicleStatusRepository _repository;

  @override
  FutureOr<Response> store(Request request) async {
    final parsedBody = await parseJson(request);
    if (parsedBody.isLeft) {
      return Response.json(
        body: {'message': parsedBody.left.message},
        statusCode: parsedBody.left.statusCode,
      );
    }
    final json = parsedBody.right;
    final createVehicleStatusData = CreateVehicleStatusDto.validated(json);
    if (createVehicleStatusData.isLeft) {
      return Response.json(
        body: {
          'message':
              'CreateVehicleStatusDto: ${createVehicleStatusData.left.message}',
          'errors': createVehicleStatusData.left.errors,
        },
        statusCode: createVehicleStatusData.left.statusCode,
      );
    }

    final res =
        await _repository.createVehicleStatus(createVehicleStatusData.right);
    return res.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
        statusCode: HttpStatus.created,
      ),
    );
  }

  /// Get last vehicle status
  FutureOr<Response> getLastStatus(String vehicleId) {
    final lastReport = _repository.getLastVehicleStatusByVehicle(vehicleId);
    return lastReport.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) {
        print('Last report $right');
        return Response.json(body: right.toJson());
      },
    );
  }
}
