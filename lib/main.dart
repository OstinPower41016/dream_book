import 'package:dream_book/core/config/timezone.dart';
import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale("ru"), const Locale("en")],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.instance.setup();
  TimeZone().init();

  runApp(App());
}
