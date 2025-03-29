import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';

class CusttomListCart extends StatelessWidget {
  final String image;
  final Widget title;
  final String subtitle;
  final String textCount;
  final void Function()? onAdd;
  final void Function()? onDelete;

  const CusttomListCart(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.textCount,
      required this.onAdd,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl: image,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )),
              Expanded(
                flex: 3,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  title: title,
                  subtitle: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "price: $subtitle",
                        style: const TextStyle(color: AppColor.primaryColor),
                      )),
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
                    Text(textCount),
                    IconButton(onPressed: onDelete, icon: const Icon(Icons.remove)),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
