import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/address/address_view_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/public/handlingdataview.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: AppBar(title: const Text("Address View"),centerTitle: true,backgroundColor: AppColor.secondColor,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          controller.goToAddAddress();
        },
        child:const Icon(
          Icons.add,
          color: AppColor.secondColor,
        ),
      ),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        controller.removeAddress(
                            controller.data[index].AddressId!);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Card(
                          color: AppColor.secondColor,
                          elevation: 2.0,
                          child: ListTile(
                            title:
                                Text("${controller.data[index].AddressCity}"),
                            trailing: Text(
                              "${controller.data[index].AddressName}",
                              style:const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                            subtitle:
                                Text("${controller.data[index].AddressStreet}"),
                          ),
                        ),
                      ),
                    );
                  },
                ))),
      ),
    );
  }
}
