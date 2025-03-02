import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iug/data/model/categorymodel.dart';

import '../../../controller/items/items_controller.dart';
import '../../../core/constant/app_color/app_color.dart';

class CustomListItems extends GetView<ItemsController> {
  const CustomListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, i) => const SizedBox(width: 5),
        scrollDirection: Axis.horizontal,
        itemCount: controller.category.length,
        itemBuilder: (context, index) {
          return Items(
              categoryModel: Categorymodel.fromJson(controller.category[index]),
              i: index);
        },
      ),
    );
  }
}

class Items extends GetView<ItemsController> {
  final int i;
  final Categorymodel categoryModel;

  const Items({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsController>(builder:(controller) =>InkWell(
      onTap: () {
        controller.changeCat(i,categoryModel.catId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColor.fourthColor, width: 3)))
                  : null,
              child: Text(
                "${categoryModel.catName}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColor.thirdColor),
              ),
            )
          ],
        ),
      ),
    ), );
  }
}
