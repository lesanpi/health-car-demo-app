import 'package:health_car_demo_app/app/app.dart';
import 'package:health_car_demo_app/bootstrap.dart';
import 'package:health_car_demo_app/src/data/repositories/background_repository.dart';

void main() {
  bootstrap(() {
    return const App(
      apiHost: 'healt-car-api.globeapp.dev',
    );
  });
}
