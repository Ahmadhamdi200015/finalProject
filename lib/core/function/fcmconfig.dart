import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';



RequestPermissoinNotification()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

getRequestPermission()async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Get.snackbar("Warning", "Location services are disabled");
    // return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar("Warning", "Location permissions are denied");
      // return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Get.snackbar("Warning", "Location permissions are permanently denied, we cannot request permissions.");
    // return Future.error(
    //     'Location permissions are permanently denied, we cannot request permissions.');
  }
}

fcmconfig(){
  FirebaseMessaging.onMessage.listen((message){
    print("===============================================");
    print(message.notification?.title);
    print(message.notification?.body);
    print(Get.currentRoute);
    print("===============================================");
    Get.snackbar("${message.notification?.title}","${message.notification?.body}");
    // refreshNotification(message.data);



  });
}
// refreshNotification(data){
//   if(Get.currentRoute=="/PendingOrders" && data['pagename']=="refreshorderpending"){
//     PendingorderController controller=Get.find();
//     controller.getOrders();
//   }
// }