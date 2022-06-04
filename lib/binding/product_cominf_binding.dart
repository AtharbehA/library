

import 'package:get/get.dart';

import '../controller/controller_ebook_coming.dart';



class ComingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ComingController());
  }


}