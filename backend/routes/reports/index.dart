import 'package:backend/report_mileage/report_mileage_controller.dart';
import 'package:backend/request_handlers/unimplemented_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final controller = context.read<ReportMileageController>();

  switch (context.request.method) {
    case HttpMethod.get:
      return controller.index(context.request);
    case HttpMethod.post:
      return controller.store(context.request);
    case HttpMethod.delete:
    case HttpMethod.put:
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
      return unimplementedHandler(context);
  }
}
