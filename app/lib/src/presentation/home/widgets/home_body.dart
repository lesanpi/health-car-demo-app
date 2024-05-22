import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/home/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/vehicles/vehicles.dart';
import 'package:newton_particles/newton_particles.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Newton(
        activeEffects: [
          RainEffect(
            particleConfiguration: ParticleConfiguration(
              shape: CircleShape(),
              size: const Size(5, 5),
              color: SingleParticleColor(
                color: Colors.white.withOpacity(0.05),
              ),
            ),
            effectConfiguration: const EffectConfiguration(
              maxDuration: 10000,
            ),
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                children: const [
                  WelcomeView(),
                  PermissionRequestView(),
                  VehiclesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🚙',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          Text(
            '¡Bienvenido!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          const Text(
            '¡Toma el control de tu vehículo!',
            style: TextStyle(fontSize: 24),
          ),
          const Text(
            'Con esta app podrás monitorear en tiempo real el estado de salud de tu vehículo, previniendo averías y optimizando su rendimiento.',
            style: TextStyle(fontSize: 18),
          ),
          const Gap(Consts.margin * 2),
          Text(
            '⚠️',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
          const Text(
            'Importante:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            '''
* Esta app se encuentra en fase de prueba y solo está disponible para monitorear un vehículo de prueba específico.''',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            '''
* La información que visualizas en esta app proviene directamente de un vehículo de prueba y se actualiza constantemente. Sin embargo, es importante tener en cuenta que los datos se encuentran en fase de prueba y podrían presentar un margen de error.''',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            '''
* La app no está destinada a ser utilizada como un reemplazo para el diagnóstico o reparación profesional de vehículos.''',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class PermissionRequestView extends StatelessWidget {
  const PermissionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Consts.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '⚠️',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          Text(
            'Necesitamos algunos permisos',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          const Text(
            'Para brindarte la mejor experiencia, necesitamos algunos permisos:',
            style: TextStyle(fontSize: 16),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
            subtitle: Text(
              'Te enviaremos notificaciones importantes sobre el estado de tu vehículo.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.location_pin),
            title: Text('Ubicación en segundo plano'),
            subtitle: Text(
              'Te permitirá recibir notificaciones incluso cuando la app no esté en uso.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.bluetooth),
            title: Text('Bluetooth'),
            subtitle: Text(
              'Te permitirá comunicarte con los dispositivos IoT',
            ),
          ),
          const Text(
            'También te pedimos que actives la opción "Permitir actividad en segundo plano" para que la app pueda funcionar sin interrupciones, incluso con baja batería.',
            style: TextStyle(fontSize: 16),
          ),
          const Gap(Consts.margin),
          ElevatedButton(
            // Implementar la lógica para abrir la configuración de permisos
            // y solicitar la opción "Permitir actividad en segundo plano"
            onPressed: () async {
              context
                  .read<BackgroundProcessBloc>()
                  .add(const RequestPermissionPressed());
            },
            child: const Center(child: Text('Activar permisos')),
          ),
        ],
      ),
    );
  }
}
