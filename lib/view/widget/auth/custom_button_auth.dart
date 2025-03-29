import 'package:flutter/material.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

class CustomButtonAuth extends StatelessWidget{
  final String txtBtn;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.txtBtn,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        minWidth: MediaQuery.sizeOf(context).width,
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        onPressed:onPressed,
        child:  Text(
          txtBtn,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}