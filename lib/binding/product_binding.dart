


import 'package:ebook_read/controller/controller_ebook_bottomfav.dart';
import 'package:ebook_read/controller/payment_controller.dart';
import 'package:get/get.dart';

import '../controller/controller_ebook_category.dart';
import '../controller/controller_ebook_slider.dart';
import '../controller/setting_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(FavoritesController());
    Get.put(PaymentController());
    Get.put(SettingController());
    // Get.lazyPut(() => DetailController());
  }


}