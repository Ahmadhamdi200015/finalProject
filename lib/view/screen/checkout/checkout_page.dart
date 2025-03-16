import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/view/widget/checkout/custtom_checkout_method.dart';

import '../../../controller/checkout/check_out_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,title: const Text('CheckOut',style: TextStyle(color:AppColor.thirdColor),),),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: AppColor.primaryColor,
            onPressed: () {
              controller.addOrders();
            },
            child: const Text(
              'CheckOut',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: GetBuilder<CheckOutController>(
          builder: (controller) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        textAlign: TextAlign.start,
                        'Shipping Address',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  ListTile(
                    title:  Text(
                      controller.shippingAddressLabel??'',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle:  Text(
                      "${controller.shippingAddressCity} , ${controller.shippingAddressStreet}",
                      style: const TextStyle(color: AppColor.thirdColor),
                    ),
                    trailing: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          controller.goToShippingPage();
                        },
                        icon: const Text(
                          'Change',
                          style: TextStyle(color: AppColor.primaryColor),
                        )),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        textAlign: TextAlign.start,
                        'Payment Method',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  GetBuilder<CheckOutController>(builder: (controller) {
                    return Column(
                      children: [
                        RadioListTile(
                            value: 0,
                            activeColor: Colors.red,
                            title: const Text(
                              'Cash',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            groupValue: controller.selectedValue,
                            onChanged: (val) {
                              controller.changeValue(val);
                            }),
                        RadioListTile(
                            value: 1,
                            activeColor: Colors.red,
                            title: const Text(
                              'Card',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            groupValue: controller.selectedValue,
                            onChanged: (val) {
                              controller.changeValue(val);
                            }),
                      ],
                    );
                  }),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        textAlign: TextAlign.start,
                        ' Deliver Type',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  CusttomCheckoutMethod(
                      txtMethod: 'Delivery Man',
                      onTap: () {
                        controller.chooseType('0');
                      },
                      active: controller.checkType=='0'?true:false,
                      txtSub: 'anything'),
                  CusttomCheckoutMethod(
                      txtMethod: 'pick it by yourself ',
                      onTap: () {
                        controller.chooseType('1');
                      },
                      active: controller.checkType=='1'?true:false,
                      txtSub: 'anything')
                ],
              ),
            );
          },
        ));
  }
}
