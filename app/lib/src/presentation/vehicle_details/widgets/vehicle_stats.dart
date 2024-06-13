import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_car_demo_app/app/constant.dart';

class SimpleStatCard extends StatelessWidget {
  const SimpleStatCard({
    required this.title,
    required this.description,
    required this.icon,
    this.color,
    super.key,
  });
  final String title;
  final String description;
  final Widget icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 11,
      child: Card(
        elevation: 0,
        color: color ?? Colors.black12,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Consts.padding,
            vertical: Consts.margin,
          ),
          child: Column(
            children: [
              icon,
              const Gap(Consts.padding),
              Expanded(
                child: AutoSizeText(
                  title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                ),
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
