// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

class ReportMileageController extends HttpController {
  ReportMileageController({
    required ReportMileageRepository repository,
  }) : _repository = repository;
  final ReportMileageRepository _repository;

  @override
  FutureOr<Response> index(Request request) {
    final uri = request.uri;
    final vehicle = uri.queryParameters['vehicle'];

    final reports = vehicle == null || vehicle.isEmpty
        ? _repository.getAllReports()
        : _repository.getAllReportsOfVehicle(vehicle);
    return reports.fold(
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

  FutureOr<Response> getLastReport(String vehicleId) {
    final lastReport = _repository.getLastReportMileageOfVehicle(vehicleId);
    return lastReport.fold(
      (left) => Response.json(
        body: {
          'message': left.message,
        },
        statusCode: left.statusCode,
      ),
      (right) => Response.json(body: right.toJson()),
    );
  }

  @override
  FutureOr<Response> show(Request request, String id) {
    final tags = _repository.getReportById(id);
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
    final tags = _repository.deleteReport(id);
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
    final createReportData = CreateReportDto.validated(json);
    if (createReportData.isLeft) {
      return Response.json(
        body: {
          'message': 'CreateReportDtoError: ${createReportData.left.message}',
          'errors': createReportData.left.errors,
        },
        statusCode: createReportData.left.statusCode,
      );
    }

    final res = await _repository.createReport(createReportData.right);
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
