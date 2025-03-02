import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color/app_color.dart';
import '../../../core/constant/route.dart';

class CusttomAppBar extends StatelessWidget {
  final TextEditingController? myController;
  final void  Function(String)? onChanged;
  final void Function()? onPressedSearch;
   const CusttomAppBar({super.key, required this.myController, this.onChanged,required this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
              controller:myController,
              onChanged:onChanged,
          style:const TextStyle(fontFamily: "sans", color: AppColor.fourthColor),
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.thirdColor,
              prefixIcon: IconButton(onPressed:onPressedSearch, icon:const Icon(Icons.search)),
              hintText: "Find product",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              )),
        )),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.thirdColor),
          child: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.favorite,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
