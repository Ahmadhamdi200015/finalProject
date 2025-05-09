import 'package:flutter/material.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

class CusttomBottomBar extends StatelessWidget {
  final String textBottom;
  final IconData? iconBottom;
  final bool active;
  final void Function()? onPressed;

  const CusttomBottomBar(
      {super.key,
      required this.textBottom,
      this.iconBottom,
      this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: active == true
          ? const BoxDecoration(
              border: Border(top: BorderSide(color:Colors.red, width: 3)))
          : null,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Icon(
              iconBottom,
              color: active == true ? AppColor.primaryColor : Colors.grey,
            ),
            Text(
              textBottom,
              style: TextStyle(
                  fontSize: 12,
                  color: active == true ? AppColor.primaryColor : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
