import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iug/controller/home/home_page_controller.dart';
import 'package:iug/data/model/categorymodel.dart';
import 'package:iug/view/widget/public/handlingdataview.dart';

import '../../../core/constant/app_color/app_color.dart';

class CustomListCategories extends GetView<HomePageController> {
  const CustomListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: SizedBox(
      height: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: ListView.separated(
          separatorBuilder: (context, i) => const SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Category(
                categoriesModel:
                controller.categories[index],
                i: index);
          },
        ),
      ),
    )),);
  }
}

class Category extends GetView<HomePageController> {
  final int i;
  final Categorymodel categoriesModel;

  const Category({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoItemsView(
            controller.categories, i,categoriesModel.catId!);
      },
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(10)),
        child:  Text(
          "${categoriesModel.catName}",
          style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ),
    );
  }
}
