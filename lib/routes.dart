
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/view/screen/auth/change_password_page.dart';
import 'package:iug/view/screen/auth/forget_password_page.dart';
import 'package:iug/view/screen/cart/cart_page.dart';
import 'package:iug/view/screen/checkout/change_address_page.dart';
import 'package:iug/view/screen/checkout/checkout_page.dart';
import 'package:iug/view/screen/home/home_page.dart';
import 'package:iug/view/screen/auth/login_page.dart';
import 'package:iug/view/screen/auth/signup_page.dart';
import 'package:iug/view/screen/home/home_srceen.dart';
import 'package:iug/view/screen/items/items_details_page.dart';
import 'package:iug/view/screen/items/items_page.dart';
import 'package:iug/view/screen/notification/notification_page.dart';
import 'package:iug/view/screen/profile/about_page.dart';
import 'package:iug/view/screen/profile/archive_page.dart';
import 'package:iug/view/screen/profile/order_page.dart';
import 'package:iug/view/screen/profile/profile_page.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const LoginPage()),

GetPage(name:AppRoute.signPage, page:()=>const SignupPage()),
  GetPage(name:AppRoute.forgetPasswordPage, page:()=>const ForgetPasswordPage()),
  GetPage(name:AppRoute.changePasswordPage, page:()=>const ChangePasswordPage()),


  GetPage(name:AppRoute.homePage, page:()=>const HomePage()),
  GetPage(name:AppRoute.homeScreen, page:()=>const HomeScreen()),
  GetPage(name:AppRoute.itemsPage, page:()=>const ItemsPage()),
  GetPage(name:AppRoute.itemsDetailsPage, page:()=>const ItemsDetailsPage()),
  GetPage(name:AppRoute.cartPage, page:()=>const CartPage()),
  GetPage(name:AppRoute.checkoutPage, page:()=>const CheckoutPage()),
  GetPage(name:AppRoute.changeAddressPage, page:()=>const ChangeAddressPage()),
  GetPage(name:AppRoute.profilePage, page:()=>const ProfilePage()),
  GetPage(name:AppRoute.notificationPage, page:()=>const NotificationPage()),

  GetPage(name:AppRoute.orderPage, page:()=>const OrderPage()),

  GetPage(name:AppRoute.aboutPage, page:()=>const AboutPage()),
  GetPage(name:AppRoute.archivePage, page:()=>const ArchivePage()),

















];
