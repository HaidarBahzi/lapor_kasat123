import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget authForm({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required TextStyle textStyle,
  required String hintText,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    style: textStyle,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.home),
      hintText: hintText,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xff1084FD), width: 2),
        borderRadius: BorderRadius.circular(50.0),
      ),
    ),
  );
}

Widget authDropdown({
  required List<String> items,
  required String? value,
  required void Function(String?) onChanged,
  required String Function(String?)? validator,
  required void Function(String?)? onSaved,
  String hintText = 'Select an option',
  String labelText = 'Dropdown',
}) {
  return DropdownButtonFormField2<String>(
    isExpanded: true,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      hintText: hintText,
      labelText: labelText,
    ),
    hint: const Text(
      'Select an option',
      style: TextStyle(fontSize: 14),
    ),
    items: items
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
    value: value,
    validator: validator,
    onChanged: onChanged,
    onSaved: onSaved,
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
  );
}
