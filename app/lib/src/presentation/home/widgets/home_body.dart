import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/home/bloc/bloc.dart';
import 'package:health_car_demo_app/src/presentation/home/widgets/permission_request_view.dart';
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WelcomeView(),
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
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: Consts.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Toma el control de tu vehículo!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(Consts.padding),
          CarouselMessages(),
          Gap(Consts.margin),
          VehicleListTitle(),
          Gap(Consts.margin),
          VehiclesList(),
        ],
      ),
    );
  }
}

class VehicleListTitle extends StatelessWidget {
  const VehicleListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vehículos en Demo',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              // fontSize: 18,
              ),
        ),
        Text(
          '''
Este es el listado de vehículos en los que se esta haciendo esta realizando esta demo''',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class CarouselMessages extends StatelessWidget {
  const CarouselMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          WelcomeCard(),
          BetaAppWarningCard(),
        ],
        // options: CarouselOptions(
        //   autoPlay: true,
        //   viewportFraction: 1,
        //   aspectRatio: 16 / 8,
        //   autoPlayInterval: const Duration(seconds: 6),

        //   // enlargeCenterPage: true,
        // ),
      ),
    );
  }
}

class BetaAppWarningCard extends StatelessWidget {
  const BetaAppWarningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        elevation: 0,
        // color: Colors.teal.shade50,
        color: Colors.black87,

        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Consts.margin * 1.5,
            vertical: Consts.margin,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              // color: Colors.black,
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🤖 Importante',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '''
      Esta app se encuentra en fase de prueba y solo está disponible para monitorear un vehículo de prueba específico.\n''',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        elevation: 0,
        // color: Colors.amber.shade50,
        color: Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Consts.margin * 1.5,
              vertical: Consts.margin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Bienvenido! 🚙',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                ),
                const Text(
                  'Con esta app podrás monitorear en tiempo real el estado de salud de tu vehículo, previniendo averías y optimizando su rendimiento.',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
