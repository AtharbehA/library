import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/controller_ebook_latest.dart';
import '../../controller/controller_ebook_slider.dart';
import '../screen/detaill_screen.dart';

class BottomLibrary extends StatefulWidget {
  const BottomLibrary({Key? key}) : super(key: key);

  @override
  State<BottomLibrary> createState() => _BottomLibraryState();
}

class _BottomLibraryState extends State<BottomLibrary> {
  final controller = Get.find<ProductController>();
  final controllerLatest = Get.find<LatestController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controllerLatest.isLoading.value){
        return  const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }else{
        return Scaffold(
          backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode?Colors.black:Colors.white70,
            elevation: 0,
            title: Text('Library'.tr,style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black
            ),),
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,color: Get.isDarkMode?Colors.white:Colors.black,),
            ),
          ),

          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      height: 600,
                      child: GridView.builder(

                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         childAspectRatio: 5.5 / 6.0
                       ),
                        itemCount: controllerLatest.latestList.length,
                        itemBuilder: (BuildContext context , int index){
                          return GestureDetector(
                            onTap: (){
                              Get.to(() => DetailScreen(
                                modelEbook: controllerLatest.latestList[index],
                                imageUrl: controllerLatest.latestList[index].photo,

                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      controllerLatest.latestList[index].photo,
                                      fit: BoxFit.cover,
                                      height: 15.h,
                                      width: 24.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  const SizedBox(height: 1,),

                                  Container(
                                    width: 24.w,
                                    child: Text(
                                      controllerLatest.latestList[index].title,
                                      style: TextStyle(color:Get.isDarkMode?Colors.white: Colors.black),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
