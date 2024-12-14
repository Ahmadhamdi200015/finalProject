import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/app_color.dart';
import 'package:iug/core/constant/route.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColor.thirdColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(-1, -1), // ظل في الأعلى واليسار
          ),
        ]
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(color: AppColor.thirdColor),
                ),
                Text(
                  '400\$',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            MaterialButton(
              minWidth: MediaQuery.sizeOf(context).width / 1.8,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cartPage);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2.2,
            width: MediaQuery.sizeOf(context).width,
            color: AppColor.secondColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  color: Colors.transparent,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(backgroundColor: Colors.white,child:IconButton(onPressed:(){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back)))
                      , const Text('Products Details',style: TextStyle(color: AppColor.thirdColor,fontSize: 22),),
                      const CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.favorite_border_outlined))
                    ],),
                ),
                Container(alignment: Alignment.center,child: Image.asset(
                  'assets/images/phone.png',
                  width: 200,
                  height: 200,
                ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "SmartPhone",
                    style: TextStyle(color: AppColor.thirdColor),
                  )),
              const SizedBox(height: 10,),

              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Iphone 12 Pro Max",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22),
                  )),
              const SizedBox(height: 10,),
              const Text(
                'Product Details ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'AnyTextAnyTextAnyTextAnyTextAnyxtAnyText\nAnyTextAnyTextAnyTextxtAnyText\nAnyTextAnyTextAnyText',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20,),
              const Row(children: [
                Text("Select Color : ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                Text("blue",style: TextStyle(color:AppColor.thirdColor),)
              ],)
            ],
          ),)
        ],
      ),
    );
  }
}
