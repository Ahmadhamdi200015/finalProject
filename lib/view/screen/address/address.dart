import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iug/view/widget/address/app_bar_address.dart';

import '../../../controller/address/address_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/address/custtom_button_address.dart';
import '../../widget/address/custtom_form_address.dart';
import '../../widget/public/handlingdataview.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: GetBuilder<AddressController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                margin: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const AppBarAddress(titleapp: "Add Address",),
                    CusttomFormAddress(
                      mycontroller: controller.city,
                      hintText: "Enter your City",
                      labelText: "City",
                    ),
                    CusttomFormAddress(
                      mycontroller: controller.street,
                      hintText: "Enter your Street",
                      labelText: "Street",
                    ),
                    CusttomFormAddress(
                      mycontroller: controller.name,
                      hintText: "Enter your Name",
                      labelText: "Title",
                    ),
                    CusttomButtonAddress(
                        onPressed: () {
                          // controller.AddAddress();
                        }, child: const Text("Add To Address"))
                  ],
                ))),
      ),
    );
  }
}
