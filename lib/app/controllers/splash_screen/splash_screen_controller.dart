import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

const BASE_URL = 'http://103.30.180.221:8080';

class SplashScreenController extends GetxController {
  final localStorage = GetStorage();

  final r = const RetryOptions(maxAttempts: 3);

  Future<void> fetchData() async {
    Map<String, dynamic> body = {
      "nik": localStorage.read('userNIK'),
      "token": localStorage.read('accessToken'),
    };

    try {
      final response = await r.retry(
        () => http
            .post(Uri.parse("$BASE_URL/api/auth/relogin"),
                headers: {
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(body))
            .timeout(const Duration(seconds: 10)),
      );

      await Future.delayed(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        Get.offNamed('/menu/dashboard');
      } else {
        Get.offNamed('/auth/login');
      }
    } catch (e) {
      print("Error Catch: $e ");
      SmartDialog.show(
        backDismiss: false,
        clickMaskDismiss: false,
        alignment: Alignment.bottomCenter,
        builder: (_) => Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const Text('FAILED TO IDK'),
                ElevatedButton(
                    onPressed: () => FlutterExitApp.exitApp(iosForceExit: true),
                    child: const Text('Tutup Aplikasi'))
              ],
            ),
          ),
        ),
      );
    }
  }
}
