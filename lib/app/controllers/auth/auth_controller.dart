import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:retry/retry.dart';

const BASE_URL = 'http://103.30.180.221:8080';
const r = RetryOptions(maxAttempts: 3);

class RegisterController extends GetxController {
  final nikInputCtl = TextEditingController();
  final namaLengkapInputCtl = TextEditingController();
  final tanggalDaftarInputCtl = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final emailInputCtl = TextEditingController();
  final passwordInputCtl = TextEditingController();
  final tempatLahirInputCtl = TextEditingController();
  final tanggalLahirInputCtl = TextEditingController();
  final gelarDepanInputCtl = TextEditingController();
  final jenisKelaminInputCtl = null.obs;
  final agamaInputCtl = null.obs;
  final alamatDomisiliInputCtl = TextEditingController();
  final kabupatenKotaDomisiliInputCtl = TextEditingController();
  final provinsiDomisiliInputCtl = TextEditingController();

  final List<String> genderItems = [
    'Laki-laki',
    'Perempuan',
  ];

  final List<String> religionItems = [
    'Islam',
    'Kristen',
    'Katholik',
    'Hindu',
    'Buddha',
    'Konghucu',
    'Kepercayaan',
  ];
}

class LoginController extends GetxController {
  final nikInputCtl = TextEditingController();
  final passwordInputCtl = TextEditingController();

  Future<void> login() async {
    Map<String, dynamic> body = {
      'nik': nikInputCtl.text,
      'password': passwordInputCtl.text
    };

    SmartDialog.showLoading();
    await Future.delayed(Duration(milliseconds: 500));
    SmartDialog.dismiss();

    try {
      final response = await r.retry(
        () => http
            .post(Uri.parse("$BASE_URL/api/auth/login"),
                headers: {
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(body))
            .timeout(const Duration(seconds: 5)),
      );

      if (response.statusCode == 200) {
        Get.offNamed('/menu/dashboard');
      } else {
        SmartDialog.showNotify(
            msg: jsonDecode(response.body)['detail'][0]['msg'],
            notifyType: NotifyType.failure);
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

class ResetPasswordController extends GetxController {}
