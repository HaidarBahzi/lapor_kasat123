import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/controllers/splash_screen/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      controller.fetchData();
    });

    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/ic_app_transparent.png',
        width: 200,
      ),
    ));
  }
}

Widget osas() {
  return ElevatedButton(
    child: Text('pencet'),
    onPressed: () => SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      alignment: Alignment.bottomCenter,
      builder: (_) => Container(
        width: double.infinity,
        height: 200,
        color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              Text('exit'),
              ElevatedButton(
                  onPressed: () => FlutterExitApp.exitApp(iosForceExit: true),
                  child: Text('data'))
            ],
          ),
        ),
      ),
    ),
  );
}
