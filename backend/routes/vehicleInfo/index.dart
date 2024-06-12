import 'package:backend/request_handlers/unimplemented_handler.dart';
import 'package:backend/vehicle_status/vehicle_status_controller.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final controller = context.read<VehicleStatusController>();

  switch (context.request.method) {
    case HttpMethod.post:
      return controller.store(context.request);
    case HttpMethod.get:
    case HttpMethod.put:
    case HttpMethod.patch:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
      return unimplementedHandler(context);
  }
}
