import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/controller/items/items_controller.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/view/widget/products/custom_list_items.dart';
import 'package:gazaStore/view/widget/public/handlingdataview.dart';

import '../../../applink.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items',
          style: TextStyle(
            color: AppColor.thirdColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            // const CustomListItems(),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<ItemsController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.goToProductDetails(controller.productsList[index]);
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
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: 100,
                                    imageUrl: "${AppLink.imagesItems}${controller.productsList[index].productImage}",
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child:  Text(
                                "${controller.productsList[index].brand}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child:  Text(
                                "${controller.productsList[index].name}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Price : "),
                                Text(
                                  "${controller.productsList[index].price}\$",
                                  style:
                                      const TextStyle(color: AppColor.primaryColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
