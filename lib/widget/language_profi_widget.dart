


import 'package:ebook_read/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my_string.dart';

class LanguageWidget extends StatelessWidget {

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_)=>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,

              child: InkWell(
                onTap: () async{


                },
                splashColor: Colors.blue[200],
                borderRadius: BorderRadius.circular(12),
                customBorder: const StadiumBorder(),

                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.isDarkMode?Colors.red:Colors.blue,
                      ),
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Text('Language'.tr,style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),)
                  ],
                ),

              ),
            ),

            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Get.isDarkMode?Colors.white:Colors.black,
                    width: 2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Get.isDarkMode?Colors.black:Colors.white,
                  iconSize: 25,
                  icon:  Icon(Icons.arrow_drop_down,color: Get.isDarkMode?Colors.white:Colors.black,),

                  items:  [
                    DropdownMenuItem(
                      child: Text(english,style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                      value: ene,
                    ),
                    DropdownMenuItem(
                      child: Text(arabic,style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                      value: ara,
                    ),
                  ],
                  value: controller.langLocal,
                  onChanged: (value) {
                    controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}
