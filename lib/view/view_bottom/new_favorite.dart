
import 'package:ebook_read/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../controller/controller_ebook_latest.dart';

class NewFavorite extends StatelessWidget {
  final controller = Get.put(LatestController());
   NewFavorite({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,

      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white70,
        elevation: 0,
        title: Text('Favorites'.tr,style: TextStyle(
          color: Get.isDarkMode?Colors.white:Colors.black,
          fontSize: 25,
        ),
        ),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.newFavoritesList.isEmpty){
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(height: 100,width: 100,
                  child: Text('Please, Add Your Favorite Book'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        }else{
          return ListView.separated(
              itemBuilder: (context,index){
                return buildFavItem(
                  image: controller.newFavoritesList[index].photo,
                  id: controller.newFavoritesList[index].id,
                  title: controller.newFavoritesList[index].title,
                  author: controller.newFavoritesList[index].authorName,

                );
              },
              separatorBuilder: (context,index){
                return Divider(
                  color:Get.isDarkMode?Colors.white: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.newFavoritesList.length
          );
        }

      }),
    );
  }

  Widget buildFavItem(

  {
  required String image,
    required int id,
    required String title,
    required String author,
}

  ){
    return Padding(

      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            const SizedBox(width: 15,),

            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,

                    ),

                  ),
                  SizedBox(height: 10,),
                  Text(author,
                    style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),

                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: (){
                  controller.newManageFavorites(id);
                },
                icon: const Icon(Icons.favorite,
                  color: Colors.red,
                  size: 30,))
          ],
        ),
      ),


    );
  }
}
