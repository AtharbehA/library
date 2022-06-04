

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/setting_controller.dart';
import '../controller/theme_controller.dart';


class DarkModeWidget extends StatelessWidget {
  final controller = Get.find<SettingController>();

   DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),

        Switch(
            activeTrackColor:Get.isDarkMode?Colors.red: Colors.blue,
            activeColor:Get.isDarkMode?Colors.red:Colors.blue,
            value: controller.switchValue.value,
            onChanged: (value){
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            }
        ),
      ],
    ),
    );
  }
}

Widget buildIconWidget(){
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),

        const SizedBox(width: 20,),


        Text('Dark Mode'.tr,style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black
        ),)

      ],
    ),
  );
}
