import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../model/model_ebook/model_ebook.dart';
import '../../widget/category_widget.dart';

class EbookCategory extends StatefulWidget {

  // int catId;
  //
  //  EbookCategory({
  //    Key? key,
  //    required this.catId
  //
  //  }) : super(key: key);

  @override
  State<EbookCategory> createState() => _EbookCategoryState();
}

class _EbookCategoryState extends State<EbookCategory> {
  // final controller = Get.find<ProductController>();
  // final controllerLatest = Get.find<LatestController>();
  //
  // Future<List<ModelEbook>>? getLatest;
  // List<ModelEbook> listLatest = [];
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLatest = fetchByCategory(listLatest, widget.catId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,

        title: Text('Category'.tr,
          style: TextStyle(
            color: Get.isDarkMode?Colors.white:Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 15,top: 15,),
          child: Column(
            children: [
              SizedBox(height: 20,),
              CategoryWidget(),
            ],
          ),
        ),
      ),
    );
/*Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: Text('L',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Card(
            child: FutureBuilder(
                future: getLatest,
                builder: (context ,AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: Colors.blue,
                      ),
                    );
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listLatest[index].photo,
                                    fit: BoxFit.cover,
                                    height: 15.h,
                                    width: 24.w,
                                  ),
                                ),
                                SizedBox(height: 0.7,),
                                Container(
                                  width: 24.w,
                                  child: Text(listLatest[index].title,
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                            ,
                          ),
                        );
                      },
                    );
                  }
                }
            ),
          ),
        ),
      ),
    );*/
    /*Obx((){
      if(controllerLatest.isLoading.value){
        return  const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }else{
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white70,
            elevation: 0,
            title: Text('Pdf Category',style: TextStyle(
                color: Colors.black
            ),),
          ),

          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      height: 500,
                      child: GridView.builder(

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5.5 / 6.0
                        ),
                        itemCount: controllerLatest.latestList.length,
                        itemBuilder: (BuildContext context , int index){
                          return GestureDetector(
                            onTap: (){

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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  const SizedBox(height: 0.7,),

                                  Container(
                                    width: 24.w,
                                    child: Text(
                                      controllerLatest.latestList[index].title,
                                      style: TextStyle(color: Colors.black),
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
    });*/
  }
}
