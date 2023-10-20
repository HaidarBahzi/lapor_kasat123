import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/controllers/auth/auth_controller.dart';
import 'package:lapor_kasat/app/views/widgets/reuse_widgets.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/ic_app_transparent.png',
                  width: width * 0.5,
                ),
                const Text('Selamat Datang!'),
                const Text('Masuk dengan akun pns anda'),
              ],
            ),
            Column(
              children: [
                authForm(
                    controller: controller.nikInputCtl,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(color: Colors.black),
                    hintText: "Masukkan NIK anda"),
                authForm(
                    controller: controller.passwordInputCtl,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textStyle: TextStyle(color: Colors.black),
                    hintText: "Masukkan Password anda"),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: const Text('Lupa Password?'))),
                ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text('Masuk')),
              ],
            ),
            TextButton(
                onPressed: () => Get.toNamed('/auth/register'),
                child: const Text('Belum punya akun? Daftar disini')),
          ],
        ),
      ),
    );
  }
}
