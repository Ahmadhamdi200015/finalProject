import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:gazaStore/controller/local/local_controller.dart';
import 'package:gazaStore/routes.dart';
import 'package:gazaStore/view/screen/auth/login_page.dart';

import 'binding/initialbinding.dart';
import 'core/function/fcmconfig.dart';
import 'core/services/service.dart';
import 'core/stripe_payment/stripe_key.dart';
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
@override
HttpClient createHttpClient(SecurityContext? context) {
  final client = super.createHttpClient(context);
  client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  return client;
}
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=StripeKey.stripePublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getRequestPermission();
  RequestPermissoinNotification();
  await InitialService();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
