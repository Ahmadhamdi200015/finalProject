import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iug/applink.dart';
import 'package:iug/controller/items/offers_controller.dart';

import '../../../controller/items/items_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/public/handlingdataview.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController itemsController=Get.put(OffersController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
          child: const Center(
            child: Text(
              'Offers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child:   GetBuilder<OffersController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.productsOffer.length,
                itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.goToProductDetails(controller.productsOffer[index]);
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
                                    imageUrl: "${AppLink.imagesItems}${controller.productsOffer[index].itemsImage}",
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child:  Text(
                                "${controller.productsOffer[index].itemsBrand}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child:  Text(
                                "${controller.productsOffer[index].itemsName}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Price : "),
                                Text(
                                  "${controller.productsOffer[index].itemsPrice}\$",
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
        ),
      ],
    ));
  }
}
