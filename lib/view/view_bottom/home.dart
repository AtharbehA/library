//
// import 'package:flutter/cupertino.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:ebook/controller/controller_ebook_slider.dart';
// import 'package:ebook/model/model_ebook/model_ebook.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   final controller = Get.find<ModelEbook>();
//
//   // Future<List<ModelEbook>>? getSlider;
//   // List<ModelEbook> listSlider = [];
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getSlider = fetchEbook(listSlider);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: SizedBox(
//           height: 27.0.h,
//             child: Swiper(
//               autoplay: true,
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context , int index){
//                 return GestureDetector(
//                   onTap: (){
//
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Container(
//                       child: Stack(
//                         children: [
//                           ClipRRect(
//                             child: Image.network(
//                               listSlider[index].photo,
//                               fit: BoxFit.cover,
//                               width: 100.0.w,
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//               )
//             ],
//           ),
//         ),
//       ),
//       // body: Container(
//       //   child: SingleChildScrollView(
//       //     child: FutureBuilder(
//       //       future: getSlider,
//       //
//       //       builder: ( context, AsyncSnapshot<List<ModelEbook>> snapshot) {
//       //         if(snapshot.connectionState == ConnectionState.done){
//       //
//       //           return Column(
//       //             children: [
//       //               Container(
//       //                 child: FutureBuilder(
//       //                   future: getSlider,
//       //
//       //                   builder: (BuildContext context, AsyncSnapshot<List<ModelEbook>> snapshot) {
//       //
//       //                     if(snapshot.connectionState == ConnectionState.done){
//       //                       return SizedBox(
//       //                         height: 27.0.h,
//       //                         child: Swiper(
//       //                           autoplay: true,
//       //                           itemCount: snapshot.data!.length,
//       //                           itemBuilder: (BuildContext context , int index){
//       //                             return GestureDetector(
//       //                               onTap: (){
//       //
//       //                               },
//       //                               child: Padding(
//       //                                 padding: EdgeInsets.all(10),
//       //                                 child: Container(
//       //                                   child: Stack(
//       //                                     children: [
//       //                                       ClipRRect(
//       //                                         child: Image.network(
//       //                                           listSlider[index].photo,
//       //                                           fit: BoxFit.cover,
//       //                                           width: 100.0.w,
//       //                                         ),
//       //                                         borderRadius: BorderRadius.circular(15),
//       //                                       )
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //                               ),
//       //                             );
//       //                           },
//       //                         ),
//       //                       );
//       //                     }else{
//       //                       return Container(
//       //
//       //                       );
//       //                     }
//       //
//       //                 },
//       //                 ),
//       //               )
//       //             ],
//       //           );
//       //         }else{
//       //           return Center(
//       //             child: CircularProgressIndicator(
//       //               color: Colors.blue,
//       //             ),
//       //           );
//       //         }
//       //     },
//       //
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }



import 'package:card_swiper/card_swiper.dart';
import 'package:ebook_read/controller/theme_controller.dart';
import 'package:ebook_read/view/screen/login_screen.dart';
import 'package:ebook_read/view/view_bottom/color_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/controller_ebook_category.dart';
import '../../controller/controller_ebook_coming.dart';
import '../../controller/controller_ebook_latest.dart';
import '../../controller/controller_ebook_slider.dart';
import '../../routes/routes.dart';
import '../pdf_by_cat/ebook_category.dart';
import '../screen/detaill_screen.dart';
import 'bottom_library.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final controller = Get.find<ProductController>();
  final controllerLatest = Get.find<LatestController>();
  final controllerComing = Get.find<ComingController>();
  final controllerCateygory = Get.find<CategoryController>();
  // final controllerDetail = Get.find<DetailController>();





  // this var ads



  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return  const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }else{

        return Scaffold(
          backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 50,
            title: const Text("E-Library"),
            centerTitle: true,
            flexibleSpace: Container(
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  gradient:Get.isDarkMode? const LinearGradient(
                      colors: [Colors.red,Colors.orange],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  ): const LinearGradient(
                      colors: [Colors.blue ,Colors.blue],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  ),
              ),

            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                   GetBuilder<LatestController>(builder: (_)
                  =>TextField(
                    controller: controllerLatest.searchTextController,
                    style: TextStyle(color: Get.isDarkMode?Colors.red:Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    onChanged: (searchName){
                      controllerLatest.addSearchToList(searchName);
                    },
                    decoration:  InputDecoration(
                      fillColor: Colors.blue.shade50,
                      focusColor: Colors.red,
                      prefixIcon: const Icon(Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: controllerLatest.searchTextController.text.isNotEmpty ?
                      IconButton(
                        onPressed: (){
                          controllerLatest.clearSearch();
                        },
                        icon:const Icon(
                            Icons.close,
                            color:Colors.black
                        ),
                      ) : null,

                      hintText: "Search with Name & Auther ",
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),

                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide:  BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                  ),
                  ),
                  // TextButton(
                  //     onPressed: (){
                  //       ThemeController().changesTheme();
                  //     },
                  //     child: Text('Dark Moda',style: TextStyle(
                  //         color: Get.isDarkMode? Colors.white:Colors.black
                  //     ),)
                  // ),
                  //slider
                  Container(
                    child: SizedBox(
                      height: 27.0.h,
                      child: Swiper(
                        autoplay: true,
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context , int index){
                          return GestureDetector(
                            onTap: (){

                              Get.to(() => DetailScreen(
                                modelEbook: controller.productList[index],
                                imageUrl: controller.productList[index].photo,

                              ));
                            },
                            child: Padding(
                              padding:  EdgeInsets.all(10),
                              child: Container(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      child: Image.network(
                                        controller.productList[index].photo,
                                        fit: BoxFit.cover,
                                        width: 100.0.w,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              end: const Alignment(0.0, -1),
                                              begin: const Alignment(0.0, 0.2),
                                              colors: [
                                                Get.isDarkMode?Colors.blue.shade300:Colors.white,
                                                Get.isDarkMode?Colors.red.shade300:Colors.black.withOpacity(0.0),
                                              ]

                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            controller.productList[index].title,
                                            style:  TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Get.isDarkMode?Colors.white:Colors.black,
                                            ),
                                          ),

                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //latest
                  controllerLatest.searchList.isEmpty &&
                      controllerLatest.searchTextController.text.isNotEmpty
                      ? Image.asset("assets/image/not-found.png")
                      : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                         Padding(
                          padding: EdgeInsets.all(10),
                          child: controllerLatest.searchTextController.text.isEmpty
                              ? Text('LaTest Ebook :'.tr,
                            style: TextStyle(
                              color: Get.isDarkMode?Colors.white:Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          )
                              : Text('Search'.tr,
                            style: TextStyle(
                              color: Get.isDarkMode?Colors.white:Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold                            ),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controllerLatest.searchList.isEmpty
                                ? controllerLatest.latestList.length+1
                                : controllerLatest.searchList.length,
                            itemBuilder: (context,index){

                              if(index == controllerLatest.latestList.length){
                                return GestureDetector(
                                  onTap: (){
                                    pushPage(context, BottomLibrary());
                                  },
                                  child: Container(
                                    width: 24.w,
                                    padding: EdgeInsets.only(top: 10.h),
                                    child:  Text('See All ',
                                      style: TextStyle(
                                          color: Get.isDarkMode?Colors.red:Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold

                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }else{
                                if(controllerLatest.searchList.isEmpty){
                                  return GestureDetector(
                                    onTap: (){

                                      Get.to(() => DetailScreen(
                                        modelEbook: controllerLatest.latestList[index],
                                        imageUrl: controllerLatest.latestList[index].photo,

                                      ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),

                                            child: Image.network(

                                              controllerLatest.latestList[index].photo,
                                              fit: BoxFit.cover,
                                              height: 15.h,
                                              width: 24.w,
                                            ),
                                          ),

                                          SizedBox(height: 0.5.h,),

                                          Container(
                                            width: 24.w,
                                            child: Text(
                                              controllerLatest.latestList[index].title,

                                              style:  TextStyle(
                                                color: Get.isDarkMode?Colors.white:Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }else{
                                  return GestureDetector(
                                    onTap: (){

                                      Get.to(() => DetailScreen(
                                        modelEbook: controllerLatest.searchList[index],
                                        imageUrl: controllerLatest.searchList[index].photo,

                                      ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),

                                            child: Image.network(

                                              controllerLatest.searchList[index].photo,
                                              fit: BoxFit.cover,
                                              height: 15.h,
                                              width: 24.w,
                                            ),
                                          ),

                                          SizedBox(height: 0.5.h,),

                                          Container(
                                            width: 24.w,
                                            child: Text(
                                              controllerLatest.searchList[index].title,

                                              style:  TextStyle(
                                                color: Get.isDarkMode?Colors.white:Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }


                              }

                            },
                          ),
                          height: 25.h,

                        )

                      ],
                    ),
                  ),
                  //ADs

                  //coming soon
                  // InkWell(
                  //   onTap: (){
                  //
                  //   },
                  //   child: Card(
                  //
                  //
                  //     color: Get.isDarkMode?Colors.red.shade100:Colors.blue.shade100,
                  //     child: Column(
                  //       children: [
                  //         Text('Coming Soon',style: TextStyle(fontSize: 30),),
                  //         Stack(
                  //           children: [
                  //             Container(
                  //
                  //               height: 180,
                  //
                  //               width: MediaQuery.of(context).size.width,
                  //               padding: EdgeInsets.only(top: 9 .h),
                  //
                  //               decoration:  BoxDecoration(
                  //                 color: Get.isDarkMode?Colors.blue.shade100:Colors.red.shade100,
                  //
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Get.isDarkMode?Colors.red.withOpacity(0.5):Colors.blue.withOpacity(0.5),
                  //                     spreadRadius: 5,
                  //                     blurRadius: 7,
                  //                     offset: Offset(0, 3), // changes position of shadow
                  //                   ),
                  //                 ],
                  //
                  //
                  //               ),
                  //
                  //             ),
                  //             SizedBox(
                  //               child: ListView.builder(
                  //                 shrinkWrap: true,
                  //                 scrollDirection: Axis.horizontal,
                  //                 itemCount: controllerComing.comingtList.length,
                  //                 itemBuilder: (context,index){
                  //
                  //                   if(controllerComing.comingtList.isEmpty){
                  //                     return Container();
                  //                   }else{
                  //                     return GestureDetector(
                  //
                  //                       onTap: (){
                  //                         Get.to(() => DetailScreen(
                  //                           modelEbook: controllerComing.comingtList[index],
                  //                           imageUrl: controllerComing.comingtList[index].photo,
                  //
                  //                         ));
                  //                       },
                  //                       child: Container(
                  //                         padding: const EdgeInsets.all(8),
                  //                         child: Column(
                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                  //                           children: [
                  //                             ClipRRect(
                  //                               borderRadius: BorderRadius.circular(15),
                  //
                  //                               child: Image.network(
                  //                                 controllerComing.comingtList[index].photo,
                  //                                 fit: BoxFit.cover,
                  //                                 height: 15.h,
                  //                                 width: 24.w,
                  //                               ),
                  //                             ),
                  //                             SizedBox(height: 0.5.h,),
                  //
                  //                             Container(
                  //                               width: 24.w,
                  //                               child: Text(
                  //                                 controllerComing.comingtList[index].title,
                  //
                  //                                 style: const TextStyle(
                  //                                   color: Colors.black,
                  //                                   fontWeight: FontWeight.w500,
                  //                                 ),
                  //                                 maxLines: 2,
                  //                                 overflow: TextOverflow.ellipsis,
                  //                               ),
                  //                             )
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     );
                  //
                  //
                  //
                  //                   }
                  //
                  //                 },
                  //               ),
                  //               height: 24.h,
                  //
                  //             ),
                  //
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Coming Soon',
                            style: TextStyle(
                                color: Get.isDarkMode?Colors.white:Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controllerComing.comingtList.length,
                              scrollDirection: Axis.horizontal,

                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    Get.to(() => DetailScreen(
                                      modelEbook: controllerComing.comingtList[index],
                                      imageUrl: controllerComing.comingtList[index].photo,

                                    ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),

                                          child: Image.network(
                                            controllerComing.comingtList[index].photo,
                                            fit: BoxFit.cover,
                                            height: 15.h,
                                            width: 24.w,
                                          ),
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(15),

                                            child: Container(
                                              color: Colors.black.withOpacity(0.6),
                                              height: 15.h,
                                              width: 24.w,
                                            )
                                        ),
                                        Positioned(
                                          bottom: 0,top: 0,right: 0,left: 0,
                                          child: Center(
                                            child: Text(
                                              'Coming Soon',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                );
                              }

                          ),
                          height: 14.h,
                        )
                      ],
                    ),
                  )


                  // category
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //           padding: EdgeInsets.all(8),
                  //         child: Text(
                  //           'Category',
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         child: ListView.builder(
                  //           shrinkWrap: true,
                  //             itemCount: controllerCateygory.categoryList.length,
                  //             scrollDirection: Axis.horizontal,
                  //
                  //             itemBuilder: (context,index){
                  //             return GestureDetector(
                  //               onTap: (){
                  //                 pushPage(context,
                  //                     EbookCategory());
                  //
                  //               },
                  //               child: Container(
                  //                 padding: EdgeInsets.all(5),
                  //                 child: Stack(
                  //                   children: [
                  //                     ClipRRect(
                  //                       borderRadius: BorderRadius.circular(15),
                  //
                  //                       child: Image.network(
                  //                         controllerCateygory.categoryList[index].photoCat,
                  //                         fit: BoxFit.cover,
                  //                         height: 15.h,
                  //                         width: 24.w,
                  //                       ),
                  //                     ),
                  //                     ClipRRect(
                  //                       borderRadius: BorderRadius.circular(15),
                  //
                  //                       child: Container(
                  //                         color: Colors.black.withOpacity(0.6),
                  //                         height: 15.h,
                  //                         width: 24.w,
                  //                       )
                  //                     ),
                  //                     Positioned(
                  //                       bottom: 0,top: 0,right: 0,left: 0,
                  //                       child: Center(
                  //                         child: Text(
                  //                           controllerCateygory.categoryList[index].name,
                  //                           style: const TextStyle(
                  //                             color: Colors.white,
                  //                             fontWeight: FontWeight.w500,
                  //                           ),
                  //                           maxLines: 1,
                  //                           textAlign: TextAlign.center,
                  //                         ),
                  //                       ),
                  //                     )
                  //
                  //
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //             }
                  //
                  //         ),
                  //         height: 14.h,
                  //       )
                  //     ],
                  //   ),
                  // )




                ],
              ),
            ),
          ),
        );
      }
    });
  }
}


// class Home extends StatelessWidget {
//
//   final controller = Get.find<ProductController>();
//   final controllerLatest = Get.find<LatestController>();
//   final controllerComing = Get.find<ComingController>();
//   final controllerCateygory = Get.find<CategoryController>();
//   // final controllerDetail = Get.find<DetailController>();
//
//
//   // this var ads
//   late BannerAd _bannerAd;
//   final bool _isBannerAdsReady = false;
//
//   String admobBanner = '', admobInterstitial = '', adsMode = '';
//   String startAppLiveMode = '', androidAppId = '', iosAppId = '',
//   accountAppId= '';
//
//   String androidBanner = '';
//
//
//    Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Obx((){
//       if(controller.isLoading.value){
//         return  const Center(
//           child: CircularProgressIndicator(
//             color: Colors.blue,
//           ),
//         );
//       }else{
//
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0.0,
//             title: Row(
//               children: [
//                 Container(
//                   child: Icon(
//                     Icons.account_circle_outlined,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(width: 3.0,),
//                 const Text("Hello",
//                 style: TextStyle(
//                 color: Colors.black
//                 ),
//                 ),
//               ],
//             ),
//           ),
//           body: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   //slider
//                   Container(
//                     child: SizedBox(
//                       height: 27.0.h,
//                       child: Swiper(
//                         autoplay: true,
//                         itemCount: controller.productList.length,
//                         itemBuilder: (BuildContext context , int index){
//                           return GestureDetector(
//                              onTap: (){
//
//                                Get.to(() => DetailScreen(
//                                  modelEbook: controller.productList[index],
//
//                                ));
//                               },
//                             child: Padding(
//                               padding:  EdgeInsets.all(10),
//                               child: Container(
//                                 child: Stack(
//                                   children: [
//                                     ClipRRect(
//                                       child: Image.network(
//                                         controller.productList[index].photo,
//                                         fit: BoxFit.cover,
//                                         width: 100.0.w,
//                                       ),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//
//                                     Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius: const BorderRadius.only(
//                                             bottomLeft: Radius.circular(15),
//                                             bottomRight: Radius.circular(15),
//                                           ),
//                                           gradient: LinearGradient(
//                                             end: const Alignment(0.0, -1),
//                                             begin: const Alignment(0.0, 0.2),
//                                             colors: [
//                                               Colors.black,
//                                               Colors.black.withOpacity(0.0),
//                                             ]
//
//                                           ),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8),
//                                           child: Text(
//                                             controller.productList[index].title,
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 17,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                           },
//                       ),
//                     ),
//                   ),
//                   //latest
//                   Container(
//                     child: Column(
//                       children:  [
//                         const Padding(
//                             padding: EdgeInsets.all(10),
//                           child: Text('LaTest Ebook',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 17,
//                           ),
//                           ),
//                         ),
//                         SizedBox(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: controllerLatest.latestList.length + 1,
//                               itemBuilder: (context,index){
//
//                               if(index == controllerLatest.latestList.length){
//                                     return GestureDetector(
//                                       onTap: (){
//                                         pushPage(context, BottomLibrary());
//                                       },
//                                       child: Container(
//                                         width: 24.w,
//                                         padding: EdgeInsets.only(top: 10.h),
//                                         child: const Text('See All ',
//                                         style: TextStyle(
//                                           color: Colors.blue,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold
//
//                                         ),
//                                         textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     );
//                               }else{
//                                 return GestureDetector(
//                                   onTap: (){
//
//                                     Get.to(() => DetailScreen(
//                                       modelEbook: controllerLatest.latestList[index],
//
//                                     ));
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(6),
//                                     child: Column(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(15),
//
//                                           child: Image.network(
//                                             controllerLatest.latestList[index].photo,
//                                             fit: BoxFit.cover,
//                                             height: 15.h,
//                                             width: 24.w,
//                                           ),
//                                         ),
//
//                                         SizedBox(height: 0.5.h,),
//
//                                         Container(
//                                           width: 24.w,
//                                           child: Text(
//                                             controllerLatest.latestList[index].title,
//
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//
//
//
//                               }
//
//                               },
//                           ),
//                           height: 27.h,
//
//                         )
//
//                       ],
//                     ),
//                   ),
//                   //coming soon
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: Stack(
//
//                       children:  [
//
//                         Container(
//
//                           height: 180,
//
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.only(top: 9 .h),
//                           child: const Text('Coming Soon',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 35,
//                               letterSpacing: 10
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           decoration:  BoxDecoration(
//                              color: Colors.red.shade100,
//                             borderRadius: BorderRadius.circular(12),
//
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.red.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3), // changes position of shadow
//                               ),
//                             ],
//
//
//                           ),
//
//
//
//
//                         ),
//                         SizedBox(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: controllerComing.comingtList.length,
//                             itemBuilder: (context,index){
//
//                               if(controllerComing.comingtList.isEmpty){
//                                 return Container();
//                               }else{
//                                 return GestureDetector(
//
//                                   onTap: (){
//                                     Get.to(() => DetailScreen(
//                                     modelEbook: controllerComing.comingtList[index],
//
//                                   ));
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(15),
//
//                                           child: Image.network(
//                                             controllerComing.comingtList[index].photo,
//                                             fit: BoxFit.cover,
//                                             height: 15.h,
//                                             width: 24.w,
//                                           ),
//                                         ),
//                                         SizedBox(height: 0.5.h,),
//
//                                         Container(
//                                           width: 24.w,
//                                           child: Text(
//                                             controllerComing.comingtList[index].title,
//
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//
//
//
//                               }
//
//                             },
//                           ),
//                           height: 24.h,
//
//                         )
//
//                       ],
//                     ),
//                   ),
//                   //category
//                   // Container(
//                   //   child: Column(
//                   //     children: [
//                   //       Padding(
//                   //           padding: EdgeInsets.all(8),
//                   //         child: Text(
//                   //           'Category',
//                   //           style: TextStyle(
//                   //             color: Colors.black,
//                   //             fontWeight: FontWeight.bold
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       SizedBox(
//                   //         child: ListView.builder(
//                   //           shrinkWrap: true,
//                   //             itemCount: controllerCateygory.categoryList.length,
//                   //             scrollDirection: Axis.horizontal,
//                   //
//                   //             itemBuilder: (context,index){
//                   //             return GestureDetector(
//                   //               onTap: (){
//                   //                 pushPage(context,
//                   //                     EbookCategory());
//                   //
//                   //               },
//                   //               child: Container(
//                   //                 padding: EdgeInsets.all(5),
//                   //                 child: Stack(
//                   //                   children: [
//                   //                     ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(15),
//                   //
//                   //                       child: Image.network(
//                   //                         controllerCateygory.categoryList[index].photoCat,
//                   //                         fit: BoxFit.cover,
//                   //                         height: 15.h,
//                   //                         width: 24.w,
//                   //                       ),
//                   //                     ),
//                   //                     ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(15),
//                   //
//                   //                       child: Container(
//                   //                         color: Colors.black.withOpacity(0.6),
//                   //                         height: 15.h,
//                   //                         width: 24.w,
//                   //                       )
//                   //                     ),
//                   //                     Positioned(
//                   //                       bottom: 0,top: 0,right: 0,left: 0,
//                   //                       child: Center(
//                   //                         child: Text(
//                   //                           controllerCateygory.categoryList[index].name,
//                   //                           style: const TextStyle(
//                   //                             color: Colors.white,
//                   //                             fontWeight: FontWeight.w500,
//                   //                           ),
//                   //                           maxLines: 1,
//                   //                           textAlign: TextAlign.center,
//                   //                         ),
//                   //                       ),
//                   //                     )
//                   //
//                   //
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             );
//                   //             }
//                   //
//                   //         ),
//                   //         height: 14.h,
//                   //       )
//                   //     ],
//                   //   ),
//                   // )
//
//
//
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }






/**/