

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/controller_ebook_category.dart';
import '../controller/controller_ebook_latest.dart';
import '../controller/controller_ebook_slider.dart';
import '../view/screen/detaill_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
   CategoryItem({Key? key,
     required this.categoryTitle}) : super(key: key);

  final controller = Get.find<ProductController>();
  final controllerLatest = Get.find<LatestController>();
  final controllerCategory = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,

        appBar: AppBar(
          backgroundColor: Get.isDarkMode?Colors.black:Colors.white,

          title: Text(categoryTitle,style: TextStyle(
          color: Get.isDarkMode?Colors.white:Colors.black
        ),),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,color: Get.isDarkMode?Colors.white:Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Obx((){
        if(controllerCategory.isAllCategory.value){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }else{
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemCount: controllerCategory.categoryAllList.length,
            itemBuilder: (BuildContext context , int index){
              return GestureDetector(
                onTap: (){
                  Get.to(() => DetailScreen(
                    modelEbook: controllerCategory.categoryAllList[index],
                    imageUrl: controllerCategory.categoryAllList[index].photo,

                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          controllerCategory.categoryAllList[index].photo,
                          fit: BoxFit.cover,
                          height: 15.h,
                          width: 24.w,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      const SizedBox(height: 1),

                      Container(
                        width: 24.w,
                        child: Text(
                          controllerCategory.categoryAllList[index].title,
                          style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      })

    );
  }
}
