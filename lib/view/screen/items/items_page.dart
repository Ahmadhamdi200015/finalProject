import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/items/items_controller.dart';
import 'package:iug/core/constant/app_color.dart';
import 'package:iug/core/constant/route.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsController controller=Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items',
          style: TextStyle(color: AppColor.thirdColor,),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            GetBuilder<ItemsController>(builder: (controller) {
              return SizedBox(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 5,),
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          controller.changeItemSelected(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          decoration: BoxDecoration(
                              color:controller.selectedItems == index ? AppColor.primaryColor:AppColor.secondColor,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Text('Phones',style: TextStyle(color:controller.selectedItems ==index ? Colors.white:Colors.black),),
                        ),
                      );
                    },

                  ));
            },),
            const SizedBox(height: 20,),
             GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,crossAxisSpacing: 10,childAspectRatio:0.8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context,index){
                  return  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.itemsDetailsPage);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(
                                  'assets/images/phone.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text(
                              "iphone",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "iphone 12 pro max",
                              style: TextStyle(
                                  color: Colors.grey),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Text("Price : "),
                          Text("200\$",style: TextStyle(color: AppColor.primaryColor),)
                                                  ],)
                        ],
                      ),
                    ),
                  );
                },

              ),

          ],
        ),
      ),
    );
  }
}
