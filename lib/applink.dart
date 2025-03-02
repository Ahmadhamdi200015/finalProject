class AppLink{
  static const String server="http://206.189.59.192:9000";
  static const String signup="$server/api/register";
  static const String login="$server/api/login";
  static const String resetPassword="$server/api/password/reset";
  static const String forgetPassword="$server/api/password/forgot";

  static const String checkEmail="$server/api/email/verify";

  static const String catView="$server/api/categories";
  static const String productsView="$server/api/products";

//  ==========================Image=================================
  static const String image="$server/GLAREGROUPAPI/upload/categories";
  static const String imagesItems="$server/storage/";

//  ==========================Favorite=================================

  static const String addFav="$server/api/favorites";
  static const String removeFav="$server/api/favorites";
  static const String favView="$server/api/favorites";
  static const String favDelete="$server/api/favorites";
//=============================Cart========================================

  static const String cartDelete="$server/api/cart";
  static const String cartAdd="$server/api/cart";
  static const String cartView="$server/api/cart";
  static const String cartGetCount="$server/GLAREGROUPAPI/Cart/getcountitems.php";
  static const String cartRemove="$server/GLAREGROUPAPI/Cart/remove.php";

  //==============================Search=================================


  static const String searchView="$server/GLAREGROUPAPI/items/search.php";

//==============================Address=================================

  static const String AddAdress="$server/GLAREGROUPAPI/address/add.php";
  static const String viewAddress="$server/GLAREGROUPAPI/address/view.php";
  static const String removeAddress="$server/GLAREGROUPAPI/address/delete.php";

//==============================Coupon=================================

  static const String CouponCheck="$server/GLAREGROUPAPI/coupon/checkcoupon.php";

//==============================CheckOut=================================

  static const String CheckOut="$server/GLAREGROUPAPI/orders/checkout.php";
  static const String pendingOrder="$server/api/orders";
  static const String detailsOrder="$server/api/order-details";
  static const String archiveOrder="$server/GLAREGROUPAPI/orders/archive.php";
  static const String deleteOrder="$server/GLAREGROUPAPI/orders/delete.php";
  static const String ratingOrder="$server/GLAREGROUPAPI/rating.php";


//==============================notification=================================

  static const String notificationOrder="$server/GLAREGROUPAPI/notification.php";


//==============================Offers=================================


  static const String offersProducts="$server/GLAREGROUPAPI/offers.php";














}