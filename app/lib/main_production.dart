import 'package:health_car_demo_app/app/app.dart';
import 'package:health_car_demo_app/bootstrap.dart';

void main() {
  bootstrap(() {
    return const App(
      apiHost: 'healt-car-api-w59q1bv-lesanpi.globeapp.dev',
    );
  });
}
