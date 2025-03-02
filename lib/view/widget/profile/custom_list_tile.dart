import 'package:flutter/material.dart';
import 'package:iug/core/constant/app_color/app_color.dart';

class CustomListTile extends StatelessWidget{
  final String textTitle;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;
  const CustomListTile({super.key, required this.textTitle,required this.trailing,required this.leading, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,child: ListTile(title:Text(textTitle,style: const TextStyle(color: Colors.black),),leading:leading ,trailing:trailing,));
  }
}