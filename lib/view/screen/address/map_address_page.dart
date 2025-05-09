
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/mapaddress_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/public/handlingdataview.dart';


class MapAddressPage extends StatelessWidget {
  const MapAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapAddressController controllerPage = Get.put(MapAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Address"),
        centerTitle: true,
      ),
      body: GetBuilder<MapAddressController>(
        builder: (controllerPage) => HandlingDataView(
          statusRequest: controllerPage.statusRequest,
          widget: Column(
            children: [
              if (controllerPage.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        onTap: (latLang) {
                          controllerPage.addMarker(latLang);
                        },
                        mapType: MapType.normal,
                        markers: controllerPage.marker.toSet(),
                        initialCameraPosition: controllerPage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controller) {
                          controllerPage.controller!.complete(controller);
                        },
                      ),
                      Positioned(
                          bottom: 15,
                          child: MaterialButton(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            minWidth: 300,
                            color: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              controllerPage.goToContinueAdd();
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: AppColor.secondColor),
                            ),
                          ))
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
