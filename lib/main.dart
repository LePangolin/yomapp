import 'package:flutter/material.dart';
import 'View/acceuil_view.dart';
import 'Theme/app_theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    home: const PageAcceuil(),
  ));
}

