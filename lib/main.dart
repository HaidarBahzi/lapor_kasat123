import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lapor_kasat/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xfff8f8f8),
              inputDecorationTheme: const InputDecorationTheme(filled: true)),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: pageRoutes,
          builder: FlutterSmartDialog.init()),
    );
  }
}
