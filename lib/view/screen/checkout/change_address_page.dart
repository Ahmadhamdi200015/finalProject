import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/address/shipping_address_controller.dart';
import 'package:iug/core/constant/app_color.dart';

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
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  RadioListTile(
                      activeColor: AppColor.primaryColor,
                      subtitle: const Text(
                        ' Gaza , Strip',
                        style: TextStyle(color: AppColor.thirdColor),
                      ),
                      title: const Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      value: 'Home',
                      groupValue: controller.selectedValue,
                      onChanged: (val) {
                        controller.changeValue(val);
                      }),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  RadioListTile(
                      activeColor: AppColor.primaryColor,
                      subtitle: const Text(
                        ' Gaza , Strip',
                        style: TextStyle(color: AppColor.thirdColor),
                      ),
                      title: const Text(
                        'Friend\'s house',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      value: 'Friend\'s house',
                      groupValue: controller.selectedValue,
                      onChanged: (val) {
                        controller.changeValue(val);
                      }),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  RadioListTile(
                      activeColor: AppColor.primaryColor,
                      subtitle: const Text(
                        ' Gaza , Strip',
                        style: TextStyle(color: AppColor.thirdColor),
                      ),
                      title: const Text(
                        'office',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      value: 'office',
                      groupValue: controller.selectedValue,
                      onChanged: (val) {
                        controller.changeValue(val);
                      }),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  RadioListTile(
                      activeColor: AppColor.primaryColor,
                      subtitle: const Text(
                        ' Gaza , Strip',
                        style: TextStyle(color: AppColor.thirdColor),
                      ),
                      title: const Text(
                        'Work',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      value: 'Work',
                      groupValue: controller.selectedValue,
                      onChanged: (val) {
                        controller.changeValue(val);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: AppColor.primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.primaryColor,
                            )),
                        const Text(
                          'Add New Shipping Address',
                          style: TextStyle(color: AppColor.primaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
