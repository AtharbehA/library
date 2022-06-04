

import 'package:get/get.dart';

import '../controller/controller_ebook_latest.dart';



class LatestBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LatestController());
  }


}