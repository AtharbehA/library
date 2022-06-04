

import 'package:ebook_read/controller/controller_ebook_bottomfav.dart';
import 'package:ebook_read/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_ebook_category.dart';

class CategoryWidget extends StatelessWidget {

   CategoryWidget({Key? key,
     }) : super(key: key);

  final controller = Get.find<CategoryController>();
  final controllerFav = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
        if(controller.isLoading.value){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }else{
          return Expanded(
            child: ListView.separated(

                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      controller.getCategoryIndex(index);
                      Get.to(()=> CategoryItem(
                        categoryTitle: controller.categoryList[index].name,

                      ));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image:  DecorationImage(
                          image: NetworkImage(
                            controller.categoryList[index].photoCat,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 20,bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,

                          child: Text(
                            controller.categoryList[index].name,
                            style: TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold

                            ),),
                        ),
                      ),

                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 20,);
                },
                itemCount: controller.categoryList.length
            ),
          );
        }
      });

  }
}
