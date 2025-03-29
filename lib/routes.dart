import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/middleware/mymiddleware.dart';
import 'package:gazaStore/view/screen/address/address.dart';
import 'package:gazaStore/view/screen/address/addressview.dart';
import 'package:gazaStore/view/screen/address/map_address_page.dart';
import 'package:gazaStore/view/screen/auth/change_password_page.dart';
import 'package:gazaStore/view/screen/auth/forget_password_page.dart';
import 'package:gazaStore/view/screen/boarding/onboarding.dart';
import 'package:gazaStore/view/screen/cart/cart_page.dart';
import 'package:gazaStore/view/screen/checkout/change_address_page.dart';
import 'package:gazaStore/view/screen/checkout/checkout_page.dart';
import 'package:gazaStore/view/screen/home/home_page.dart';
import 'package:gazaStore/view/screen/auth/login_page.dart';
import 'package:gazaStore/view/screen/auth/signup_page.dart';
import 'package:gazaStore/view/screen/home/home_srceen.dart';
import 'package:gazaStore/view/screen/items/items_details_page.dart';
import 'package:gazaStore/view/screen/items/items_page.dart';
import 'package:gazaStore/view/screen/notification/notification_page.dart';
import 'package:gazaStore/view/screen/order/detailsorder.dart';
import 'package:gazaStore/view/screen/profile/about_page.dart';
import 'package:gazaStore/view/screen/profile/archive_page.dart';
import 'package:gazaStore/view/screen/profile/order_page.dart';
import 'package:gazaStore/view/screen/profile/profile_page.dart';

import 'core/middleware/myusermiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const Onboarding(),
      middlewares: [MyUserMiddleware(), MyMiddleware()]),
  GetPage(name: AppRoute.login, page: () => const LoginPage(),middlewares: [MyUserMiddleware()]),
  GetPage(name: AppRoute.signPage, page: () => const SignupPage()),
  GetPage(
      name: AppRoute.forgetPasswordPage,
      page: () => const ForgetPasswordPage()),
  GetPage(
      name: AppRoute.changePasswordPage,
      page: () => const ChangePasswordPage()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.itemsPage, page: () => const ItemsPage()),
  GetPage(
      name: AppRoute.itemsDetailsPage, page: () => const ItemsDetailsPage()),
  GetPage(name: AppRoute.cartPage, page: () => const CartPage()),
  GetPage(name: AppRoute.checkoutPage, page: () => const CheckoutPage()),
  GetPage(
      name: AppRoute.changeAddressPage, page: () => const ChangeAddressPage()),
  GetPage(name: AppRoute.profilePage, page: () => const ProfilePage()),
  GetPage(
      name: AppRoute.notificationPage, page: () => const NotificationPage()),
  GetPage(name: AppRoute.orderPage, page: () => const OrderPage()),
  GetPage(name: AppRoute.orderDetails, page: () => const DetailsOrder()),

  GetPage(name: AppRoute.aboutPage, page: () => const AboutPage()),
  GetPage(name: AppRoute.archivePage, page: () => const ArchivePage()),
  GetPage(name: AppRoute.addressPage, page: () => const AddressPage()),
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.mapAddressPage, page: () => const MapAddressPage()),
];
