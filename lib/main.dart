import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/features/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(App());
}
