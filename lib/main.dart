import 'package:dream_book/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes.toList(),
      initialRoute: Routes.HOME,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
    );
  }
}

void main() {
  runApp(App());
}
