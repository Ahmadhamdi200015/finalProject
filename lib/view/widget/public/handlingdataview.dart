import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/imageasset.dart';
import '../../../core/function/staterequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.lodaing
        ? Center(
            child: Lottie.asset(ImageAsset.loading, width: 150, height: 150))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(ImageAsset.Offline, width: 150, height: 150))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(ImageAsset.Offline,
                        width: 150, height: 150))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAsset.NoData,
                            width: 150, height: 150))
                    : widget;
  }
}
