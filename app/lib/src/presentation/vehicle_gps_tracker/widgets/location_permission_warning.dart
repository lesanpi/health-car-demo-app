import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';
import 'package:health_car_demo_app/src/presentation/permission_handler/bloc/permission_handler.dart';
import 'package:health_car_demo_app/src/presentation/permission_handler/permission_handler.dart';

class LocationPermissionWarning extends StatelessWidget {
  const LocationPermissionWarning({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionHandlerBloc, PermissionHandlerState>(
      builder: (context, state) {
        final permissionStatus = state.permissionStatus;
        final permission = state.permission;
        return Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Consts.margin,
              vertical: Consts.margin,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(Consts.margin),
                const Icon(
                  Icons.wrong_location_sharp,
                  size: 50,
                ),
                const Gap(Consts.margin),
                Text(
                  'Location permission required',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 23,
                      ),
                  textAlign: TextAlign.center,
                ),
                const Gap(Consts.padding),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                ),
                const Gap(Consts.margin),
                ElevatedButton(
                  onPressed: () {
                    if (permissionStatus == null) return;
                    if (permissionStatus.isPermanentlyDenied) {
                      context.read<PermissionHandlerBloc>().add(
                            PermissionHandlerOpenSettingsPressed(
                              permission: permission!,
                            ),
                          );
                    }
                    if (permissionStatus.isDenied) {
                      context
                          .read<PermissionHandlerBloc>()
                          .add(PermissionHandlerRequested());
                    }
                  },
                  child: const Center(
                    child: Text('Grant permission'),
                  ),
                ),
                const Gap(Consts.margin),
              ],
            ),
          ),
        );
      },
    );
  }
}
