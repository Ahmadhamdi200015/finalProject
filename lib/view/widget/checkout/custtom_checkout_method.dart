import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CusttomCheckoutMethod extends StatelessWidget {
  final String txtMethod;
  final String txtSub;
  final bool? active;
  final void Function()? onTap;

  const CusttomCheckoutMethod(
      {super.key,
      required this.txtMethod,
      required this.onTap,
      required this.active, required this.txtSub});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: active == true ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.primaryColor)
        ),
        child: ListTile(
          title: Text(
            txtMethod,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: active == true ? Colors.white : Colors.black),
          ),
          subtitle:Text(
            txtSub,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: active == true ? AppColor.secondColor : AppColor.thirdColor),
          ) ,
        )
      ),
    );
  }
}
