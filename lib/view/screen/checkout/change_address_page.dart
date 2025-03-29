import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/controller/address/shipping_address_controller.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

import '../../../core/constant/route.dart';

class ChangeAddressPage extends StatelessWidget {
  const ChangeAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShippingAddressController controller = Get.put(ShippingAddressController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Shipping Address',
            style: TextStyle(color: AppColor.thirdColor),
          ),
        ),
        body: GetBuilder<ShippingAddressController>(
          builder: (controller) {
            return controller.data.isEmpty
                ? Center(
                    child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.goToAddAddress();
                    },
                    child: const Text(
                      'Add Your Address ',
                      style:
                          TextStyle(color: AppColor.secondColor, fontSize: 20),
                    ),
                  ))
                : Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            RadioListTile(
                                activeColor: AppColor.primaryColor,
                                subtitle: Text(
                                  '${controller.data[index].AddressCity} , ${controller.data[index].AddressStreet}',
                                  style: const TextStyle(
                                      color: AppColor.thirdColor),
                                ),
                                title: Text(
                                  '${controller.data[index].AddressName}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: controller.data[index].AddressName ?? "",
                                groupValue: controller.selectedValue ?? "",
                                onChanged: (val) {
                                  controller.changeValue(
                                      val!,
                                      controller.data[index].AddressCity ?? '',
                                      controller.data[index].AddressStreet ??
                                          '',
                                      controller.data[index].AddressId!);
                                }),
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                          ],
                        );
                      },
                    ));
          },
        ));
  }
}
