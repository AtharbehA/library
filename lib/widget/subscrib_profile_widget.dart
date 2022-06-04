


import 'package:ebook_read/widget/subscrib_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payment_controller.dart';
import '../routes/routes.dart';

class Subscrib extends StatefulWidget {
  const Subscrib({Key? key}) : super(key: key);

  @override
  State<Subscrib> createState() => _SubscribState();
}

class _SubscribState extends State<Subscrib> {

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: () {
            pushPage(context, SubscribeButton());
        },
        splashColor: Get.isDarkMode?Colors.red[200]:Colors.blue[200],
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),

        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode?Colors.orangeAccent:Colors.orangeAccent,
              ),
              child: const Icon(
                Icons.subscriptions_outlined,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 20,),

            Text('Subscribe'.tr,style: TextStyle(
              color: Get.isDarkMode?Colors.white:Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),)
          ],
        ),

      ),
    );

  }


}
