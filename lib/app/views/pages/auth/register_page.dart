import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/controllers/auth/auth_controller.dart';
import 'package:lapor_kasat/app/views/widgets/reuse_widgets.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('Mari Kita Mulai!'),
                  const Text('Buat akun untuk mendapatkan semua fitur'),
                ],
              ),
              Column(
                children: [
                  authForm(
                      controller: controller.nikInputCtl,
                      keyboardType: TextInputType.number,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan NIK Anda"),
                  authForm(
                      controller: controller.namaLengkapInputCtl,
                      keyboardType: TextInputType.name,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Nama Lengkap Anda"),
                  authForm(
                      controller: controller.emailInputCtl,
                      keyboardType: TextInputType.emailAddress,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Alamat Email Anda"),
                  authForm(
                      controller: controller.passwordInputCtl,
                      keyboardType: TextInputType.visiblePassword,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Password Anda"),
                  authForm(
                      controller: controller.tempatLahirInputCtl,
                      keyboardType: TextInputType.streetAddress,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Tempat Lahir Anda"),
                  authForm(
                      controller: controller.gelarDepanInputCtl,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Gelar Depan Anda"),
                  authForm(
                      controller: controller.alamatDomisiliInputCtl,
                      keyboardType: TextInputType.streetAddress,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Alamat Domisili Anda"),
                  authForm(
                      controller: controller.kabupatenKotaDomisiliInputCtl,
                      keyboardType: TextInputType.streetAddress,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Kab/Kota Domisili Anda"),
                  authForm(
                      controller: controller.provinsiDomisiliInputCtl,
                      keyboardType: TextInputType.streetAddress,
                      textStyle: TextStyle(color: Colors.black),
                      hintText: "Masukkan Provinsi Domisili Anda"),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Lupa Password?'))),
                  ElevatedButton(
                      onPressed: () => null, child: const Text('Masuk')),
                ],
              ),
              TextButton(
                  onPressed: () => Get.toNamed('/auth/login'),
                  child: const Text('Sudah punya akun? Masuk disini')),
            ],
          ),
        ),
      ),
    );
  }
}

class idkwwdw extends StatelessWidget {
  idkwwdw({super.key});

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                hint: const Text(
                  'Select Your Gender',
                  style: TextStyle(fontSize: 14),
                ),
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Tolong pilih jenis kelamin!';
                  }
                  return null;
                },
                onChanged: (value) {},
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
