import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/app/extensions.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/vehicle_gps_tracker.dart';
import 'package:health_car_demo_app/src/presentation/vehicle_gps_tracker/widgets/location_permission_warning.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18,
  );
  List<Marker> markerList = <Marker>[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleGpsTrackerBloc, VehicleGpsTrackerState>(
      listenWhen: (previous, current) =>
          previous.reportMileage != current.reportMileage,
      listener: (context, state) async {
        final reportMileage = state.reportMileage;
        if (reportMileage == null) return;
        final location = reportMileage.geolocation;
        if (location == null) return;

        final controller = await _controller.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                location.lat,
                location.long,
              ),
              zoom: 18,
            ),
          ),
        );
        final vehicleMarker = Marker(
          markerId: const MarkerId('vehicleMarker'),
          position: LatLng(
            location.lat,
            location.long,
          ),
          icon: await getCarIcon(),
        );
        markerList = [vehicleMarker];
        setState(() {});
      },
      builder: (context, state) {
        final locationGranted = state.isPermissionGranted;
        return Stack(
          children: [
            GoogleMap(
              // style: Consts.darkMapStyle,
              myLocationButtonEnabled: false,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (controller) {
                _controller.complete(controller);

                setState(() {});
              },
              markers: markerList.toSet(),
            ),
            if (!_controller.isCompleted)
              Positioned.fill(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                )
                    .animate(
                      onComplete: (controller) => controller.repeat(),
                      delay: 400.ms,
                    )
                    .shimmer(
                      duration: 1500.ms,
                    ),
              ),
          ],
        );
      },
    );
  }

  Future<BitmapDescriptor> getUserIcon() async {
    return CircleAvatar(
      backgroundColor: Consts.primary.withOpacity(0.4),
      radius: 30,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Consts.primary,
        child: Text(
          'You',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),
      )
          .animate(
            onPlay: (controller) => controller.loop(reverse: true),
          )
          .scale(
            duration: 3500.ms,
            begin: const Offset(1, 1),
            end: const Offset(0.90, 0.90),
            curve: Curves.easeInOutSine,
          ),
    ).toBitmapDescriptor();
  }

  Future<BitmapDescriptor> getCarIcon() async {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.4),
      radius: 30,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blueGrey.shade800,
        child: Text(
          'Car',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),
      )
          .animate(
            onPlay: (controller) => controller.loop(reverse: true),
          )
          .scale(
            duration: 3500.ms,
            begin: const Offset(1, 1),
            end: const Offset(0.90, 0.90),
            curve: Curves.easeInOutSine,
          ),
    ).toBitmapDescriptor();
  }
}
