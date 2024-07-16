import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/home/bloc/bloc.dart';

class PermissionRequestView extends StatelessWidget {
  const PermissionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Consts.margin,
          vertical: Consts.margin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                '⚠️',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 80,
                    ),
                textAlign: TextAlign.center,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.87),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                context
                    .read<BackgroundProcessBloc>()
                    .add(const RequestPermissionPressed());
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, true);
                }
              },
              child: const Center(child: Text('Activar permisos')),
            ),
          ],
        ),
      ),
    );
  }
}
