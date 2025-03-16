class AppLink{
  static const String server="http://206.189.59.192:9000";
  static const String signup="$server/api/register";
  static const String login="$server/api/login";
  static const String resetPassword="$server/api/password/reset";
  static const String forgetPassword="$server/api/password/forgot";

  static const String checkEmail="$server/api/email/verify";

  static const String catView="$server/api/categories";
  static String catViewId(int id)=>"$server//categories/$id";
  static const String productsView="$server/api/products";
  static String productsCond(int catId)=>"$server/api/categories/$catId/products";
  static const String productsDis="$server/api/products/discounted";

//  ==========================Image=================================
  static const String imagesItems="$server/storage/";

//  ==========================Favorite=================================

  static const String addFav="$server/api/favorites";
  static String removeFav(int id)=>"$server/api/favorites/$id";
  static const String favView="$server/api/favorites";
//=============================Cart========================================

  static  String cartDelete(int id)=>"$server/api/cart/$id";
  static  String cartUpdate(int id)=>"$server/api/cart/$id";
  static const String cartAdd="$server/api/cart";
  static const String cartView="$server/api/cart";


  //==============================Search=================================



//==============================Address=================================

  static const String addAddress="$server/api/addresses";
  static const String viewAddress="$server/api/addresses";
  static  String removeAddress(int addressId)=>"$server/api/addresses/$addressId";
  static  String updateAddress(int addressId)=>"$server/api/addresses/$addressId";


//==============================Coupon=================================

  static const String CouponCheck="$server/GLAREGROUPAPI/coupon/checkcoupon.php";

//==============================CheckOut=================================

  static const String checkOut="$server/api/checkout";
  static const String pendingOrder="$server/api/orders";
  static  String detailsOrder(int orderId)=>"$server/api/orders/$orderId";
  static const String archiveOrder="$server/GLAREGROUPAPI/orders/archive.php";



//==============================Offers=================================


  static const String offersProducts="$server/api/products/discounted";














}