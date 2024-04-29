import 'package:backend/request_handlers/unimplemented_handler.dart';
import 'package:backend/vehicle/vehicle_controller.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final controller = context.read<VehicleController>();

  switch (context.request.method) {
    case HttpMethod.get:
      return controller.show(context.request, id);
    case HttpMethod.delete:
      return controller.destroy(context.request, id);
    case HttpMethod.put:
    case HttpMethod.patch:
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.options:
      return unimplementedHandler(context);
  }
}
