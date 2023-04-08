import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'View/acceuil_view.dart';
import 'Theme/app_theme.dart';

void main() {
  // hide bottom bar
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    home: const PageAcceuil(),
  ));
}

