import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_car_demo_app/app/theme.dart';
import 'package:health_car_demo_app/l10n/l10n.dart';
import 'package:health_car_demo_app/src/presentation/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
