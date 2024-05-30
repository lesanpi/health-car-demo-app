// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

class VehicleController extends HttpController {
  VehicleController({
    required VehicleRepository repository,
  }) : _repository = repository;
  final VehicleRepository _repository;

  @override
  FutureOr<Response> index(Request request) {
    final tags = _repository.getAllVehicles();
    return tags.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.map((e) => e.toJson()).toList(),
      ),
    );
  }

  FutureOr<Response> getLastLocationReport(String vehicleId) {
    final lastReport = _repository.getLastLocationReport(vehicleId);
    return lastReport.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) {
        print('Last location report $right');
        return Response.json(
          body: {
            'report': right?.toJson(),
          },
        );
      },
    );
  }

  @override
  FutureOr<Response> show(Request request, String id) {
    final tags = _repository.getVehicleById(id);
    return tags.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
      ),
    );
  }

  @override
  FutureOr<Response> destroy(Request request, String id) {
    final tags = _repository.deleteVehicle(id);
    return tags.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
      ),
    );
  }

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
    final createVehicleData = CreateVehicleDto.validated(json);
    if (createVehicleData.isLeft) {
      return Response.json(
        body: {
          'message': createVehicleData.left.message,
          'errors': createVehicleData.left.errors,
        },
        statusCode: createVehicleData.left.statusCode,
      );
    }

    final res = await _repository.createVehicle(createVehicleData.right);
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
}
