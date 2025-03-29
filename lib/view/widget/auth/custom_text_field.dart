import 'package:flutter/material.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? label;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      required this.keyboardType,
      required this.validator,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          label:label ,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.secondColor),
                borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: AppColor.secondColor,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
      ),
    );
  }
}
