import 'package:flutter/material.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
        'AboutUs', style: TextStyle(color: AppColor.thirdColor),),
        centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child:  const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              child: ListTile(title: Text("About Us", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
              subtitle:Text(' Thanks to remove.bg\'s clever AI, you can slash editing time - and have more fun No matter if you want to make a background transparent (PNG), add a white background to a photo, extract or isolate the subject, or get the cutout of a photo - you can do all this and more with remove.bg, the AI background remover for professionals.',
                style: TextStyle(color: AppColor.thirdColor, fontSize: 13),) ,),
            )
          ],),
      ),
    );
  }
}