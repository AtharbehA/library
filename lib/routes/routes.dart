



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../binding/product_binding.dart';
import '../binding/product_cominf_binding.dart';
import '../binding/product_latest_binding.dart';
import '../view/screen/login_screen.dart';
import '../view/screen/payment_screen.dart';
import '../view/screen/singin_screen.dart';
import '../view/screen/splash.dart';
import '../view/view_bottom/bottom_view.dart';


// final controller = Get.find<DetailController>();
class AppRoutes {
  static const bottomView = Routes.bottomView;
  static const modelEbook = Routes.modelEbook;
  static const singUpScreen=Routes.singUpScreen;
  static const loginScreen = Routes.loginScreen;
  static const ebookDetail = Routes.ebookDetail;
  static const welcome=Routes.welcomeScreen;





  static final routes = [
    GetPage(name: Routes.welcomeScreen,
      page:()=> SplashScreen(),
    ),

    GetPage(name: Routes.bottomView,
        page: () => BottomView(),
        bindings: [
          ProductBinding(),
          LatestBinding(),
          ComingBinding(),
          //CategoryBinding(),

        ]
    ),

    GetPage(name: Routes.singUpScreen,
        page: () => SingIn(),

    ),

    GetPage(name: Routes.loginScreen,
      page: () => LogIn(),

    ),

  /*  GetPage(name: Routes.paymentScreen,
      page: () => PaymentScreen(),
        bindings: [
          ProductBinding(),
          LatestBinding(),
          ComingBinding(),
          //CategoryBinding(),

        ]

    ),*/
    // GetPage(name: Routes.ebookDetail,
    //   page: () => EbookDetail(),
    //
    //   bindings: [
    //     ProductBinding(),
    //   ]
    //
    // ),



    // GetPage(name: Routes.ebookDetail,
    //   page: () => EbookDetail(
    //     ebookId: controller.detailList[index].id,
    //     status: controller.detailList[index].statusNews,
    //   ),
    //   bindings: [
    //     ProductBinding(),
    //   ]
    //
    // ),





  ];
}
class Routes{
  static const welcomeScreen= '/welcomeScreen';
  static const modelEbook= '/modelEbook';
  static const loginScreen= '/loginScreen';
  static const singUpScreen ='/singUpScreen';
  static const ebookDetail='/ebookDetail';
  static const bottomView ='/BottomView';
  static const cartScreen ='/cartScreen';
  static const paymentScreen = '/paymentScreen';
}



void pushPage(BuildContext context,Widget widget){
  Navigator.push(context, MaterialPageRoute(
    builder: (context)=>widget
  ));
}

void pushAndRemove(BuildContext context, Widget widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context)=>widget
  ),
      ((Route<dynamic> route) => false)
  );
}