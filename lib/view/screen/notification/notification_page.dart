import 'package:flutter/material.dart';
import 'package:iug/core/constant/app_color.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Notification',style: TextStyle(color: AppColor.thirdColor),),centerTitle: true,actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primaryColor),
          child: const Text(
            '2 New ',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],),
      body: Container(
        margin: const EdgeInsets.only( top: 20,right: 20,left: 20),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.bus_alert,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Order Shipped',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('1h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.payment_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'New PayPal Added',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('1h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),

              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.star_border_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Flash Sale Alert',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('2h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),

              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.reviews_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Product Review Request',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('1h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.payment_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'New PayPal Added',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('1h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.secondColor,
                    child: Icon(
                      Icons.bus_alert,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Order Shipped',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'TextTextTextTextTextText\nTextTextTextText\nTextText',
                        style: TextStyle(color: AppColor.thirdColor,fontSize: 12),
                      ),
                      trailing: Text('1h',style: TextStyle(color: AppColor.thirdColor),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
