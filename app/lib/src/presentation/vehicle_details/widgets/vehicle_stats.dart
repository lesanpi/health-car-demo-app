import 'package:flutter/material.dart';
import 'package:health_car_demo_app/app/constant.dart';

class SimpleStatCard extends StatelessWidget {
  const SimpleStatCard({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });
  final String title;
  final String description;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 11,
      child: Card(
        elevation: 0,
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Consts.padding,
            vertical: Consts.margin,
          ),
          child: Column(
            children: [
              Expanded(child: icon),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 25,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
