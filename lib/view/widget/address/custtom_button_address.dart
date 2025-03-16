import 'package:flutter/material.dart';

import '../../../core/constant/app_color/app_color.dart';

class CusttomButtonAddress extends StatelessWidget{
  final  void Function()? onPressed;
  final Widget? child;
  const CusttomButtonAddress({super.key,required this.onPressed,required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        color:AppColor.primaryColor,
        textColor: AppColor.secondColor,
        onPressed:onPressed,
        child:child,
      ),
    );
  }
}