/*  final String imageUrl;
  final String title;
  final String author;
  final String publisher;
  final int pages;
  final int free;
  final int status;
  final String description;
  final int ebookId;
  String id = '', name = '', email='';
   DetailWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
     required this.author,
     required this.publisher,
     required this.pages,
     required this.free,
     required this.status,
     required this.description,
     required this.ebookId}) : super(key: key);

  CarouselController carouselController = CarouselController();
  late SharedPreferences preferences;
  @override
  void initState(){
    loadLogin().then((value) {
      id = value[0];
    });
  }
  */
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:ebook_read/controller/controller_ebook_bottomfav.dart';
import 'package:ebook_read/controller/controller_ebook_coming.dart';
import 'package:ebook_read/model/model_ebook/model_ebook.dart';
import 'package:ebook_read/routes/routes.dart';
import 'package:ebook_read/widget/shared_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controller/api.dart';
import '../controller/controller_ebook_latest.dart';
import '../controller/controller_ebook_slider.dart';
import '../controller/controller_save_facoirte.dart';
import '../view/screen/payment_screen.dart';
import '../view/view_bottom/bottom_library.dart';

class DetailWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String publisher;
  final int pages;
  final int free;
  final int status;
  final String description;
  final int ebookId;
  final int catId;
  final String pdf;
  DetailWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.publisher,
    required this.pages,
    required this.free,
    required this.status,
    required this.description,
    required this.ebookId,
    required this.catId,
    required this.pdf
  }) : super(key: key);
  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  Future<List<ModelEbook>>? getDetail;
  List<ModelEbook> listDetail = [];
  String id = '', name = '', email='', checkFavorite = "0";
  CarouselController carouselController = CarouselController();
  final controller = Get.find<LatestController>();
  final controllerProduct = Get.find<ProductController>();
  final controllerFav = Get.find<FavoritesController>();
  late SharedPreferences preferences;
  @override
  void initState(){
    super.initState();
    loadLogin().then((value) {
      id = value[0];
      name = value[1];
      email = value[2];
      checkFavorites(id);
    });
  }

  checkFavorites(String userId)async{
    var data = {'id_course ': widget.ebookId, 'id_user': userId};

    var checkFav = await Dio().post(
        '$baseUrl/utils/checkfav.php',
        data: data);

    var response = checkFav.data;

    setState(() {
      checkFavorite = response;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(widget.title,
                        style: TextStyle(
                          color: Get.isDarkMode?Colors.red.shade300:Colors.blue.shade300,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      OutlineButton(
                        onPressed: (){
                          pushPage(context, BottomLibrary());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        borderSide: BorderSide(
                            width: 3,
                            color: Get.isDarkMode?Colors.red.shade300:Colors.blue.shade300
                        ),
                        child: Text(
                          'View All'.tr,
                          style: TextStyle(
                              color: Get.isDarkMode?Colors.red.shade300:Colors.blue.shade300
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
              Text(widget.author,style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black54,
              ),),
              Text(widget.publisher,style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black54,
              ),),

              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.orange.shade700,size: 20,),
                  Icon(Icons.star,color: Colors.orange.shade700,size: 20,),
                  Icon(Icons.star,color: Colors.orange.shade700,size: 20,),
                  Icon(Icons.star,color: Colors.orange.shade700,size: 20,),
                  Icon(Icons.star,color: Colors.grey,size: 20,),
                  SizedBox(width: 5,),
                  Text('4.0',style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              SizedBox(height: 20,),
              Divider(
                thickness: 1.5,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5),

                child: Row(
                  children: [
                    widget.free == 1 ? Text('free'.tr,
                      style: TextStyle(
                          color: Get.isDarkMode?Colors.red:Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ) : Text('premuim'.tr,
                      style: TextStyle(
                          color: Get.isDarkMode?Colors.red:Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Icon(
                    //   Icons.favorite,
                    //   color: Colors.red,
                    // ),
                    // SizedBox(width: 10,),
                    // Text('22',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    // Text('Likes',style: TextStyle(fontSize: 15,color: Colors.black54),),
                    SizedBox(width: 55,),
                    Icon(Icons.message,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Text('${widget.pages}Page'.tr,style: TextStyle(fontSize: 15,color: Get.isDarkMode?Colors.red:Colors.blue),),
                    SizedBox(width: 55,),
                    GestureDetector(
                        onTap: (){
                          _share();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.share,color: Get.isDarkMode?Colors.red:Colors.blue,),
                            SizedBox(width: 10,),
                            Text('Share'.tr,style: TextStyle(fontSize: 15,color: Get.isDarkMode?Colors.red:Colors.blue),),
                          ],
                        )

                    ),
                  ],
                ),


              ),
              Divider(thickness: 1.5,),
              Text('About the book'.tr,
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 10,),
              Html(
                data: widget.description,


              ),
              SizedBox(height: 30,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.status == 0
                        ? ButtonTheme(
                        minWidth: 160,
                        height: 45,
                        child: FlatButton.icon(
                          onPressed: (){

                          },
                          icon: Icon(Icons.book,color: Colors.white,),
                          label: Text('COMING SOON'.tr,style: TextStyle(
                              color: Colors.white
                          ),),
                          color: Get.isDarkMode?Colors.red:Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        )
                    )  : widget.free == 1
                        ? ButtonTheme(
                        minWidth: 160,
                        height: 45,
                        child: FlatButton.icon(
                          onPressed: (){
                            _readEbook(widget.pdf);
                          },
                          icon: Icon(Icons.book,color: Colors.white,),
                          label: Text('READ FREE'.tr,style: TextStyle(
                              color: Colors.white
                          ),),
                          color: Get.isDarkMode?Colors.red:Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        )
                    )
                        : ButtonTheme(
                        minWidth: 160,
                        height: 45,
                        child: FlatButton.icon(
                          onPressed: (){

                            pushPage(context, PaymentScreen(pdf: widget.pdf,));
                          },
                          icon: Icon(Icons.book,color: Colors.white,),
                          label: Text('READ PREMUIM'.tr,style: TextStyle(
                             color: Colors.white
                          ),),
                          color: Get.isDarkMode?Colors.red:Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        )
                    ),

                    Obx(() =>
                        // IconButton(
                        //     onPressed: ()async{
                        //       controller.newManageFavorites(widget.ebookId);
                        //
                        //       await showDialog(
                        //           builder: (myFavorite) => FutureProgressDialog(
                        //
                        //         saveToFavorite(
                        //             context: myFavorite,
                        //             idCourse: widget.ebookId.toString(),
                        //             idUser: id),
                        //
                        //
                        //       ),
                        //         context: context,
                        //       ).then((value) async {
                        //         preferences = await SharedPreferences.getInstance();
                        //         dynamic fav = preferences.get('saveFavorite');
                        //         controller.manageFavorite(widget.ebookId);
                        //         controller.manageFavorite(widget.ebookId);
                        //
                        //         setState(() {
                        //           checkFavorite = fav;
                        //         });
                        //       });
                        //     },
                        //     icon: controller.newIsFavorites(widget.ebookId)
                        //         ?Icon(Icons.favorite,color: Colors.red,)
                        //         :Icon(Icons.favorite_outline,color: Colors.red,),
                        // ),

                        ButtonTheme(
                            minWidth: 160,
                            height: 45,
                            child: FlatButton.icon(
                              onPressed: ()async{
                                controller.newManageFavorites(widget.ebookId);

                                await showDialog(
                                    builder: (myFavorite) => FutureProgressDialog(

                                  saveToFavorite(
                                      context: myFavorite,
                                      idCourse: widget.ebookId.toString(),
                                      idUser: id),


                                ),
                                context: context,
                                ).then((value) async {
                                preferences = await SharedPreferences.getInstance();
                                dynamic fav = preferences.get('saveFavorite');


                                setState(() {
                                checkFavorite = fav;
                                });
                                });
                              },
                              icon: controller.newIsFavorites(widget.ebookId)
                                  ?Icon(Icons.favorite,color: Colors.red,)
                                  :Icon(Icons.favorite_outline,color: Colors.red,),
                              label: Text('FAVORITE'.tr,style: TextStyle(
                                  color: Colors.white
                              ),),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                            )
                        )
                    ),
                    //  GestureDetector(
                    //     onTap: () async{
                    //
                    //       controller.manageFavorite(widget.ebookId);
                    //       await showDialog(
                    //         builder: (myFavorite) => FutureProgressDialog(
                    //
                    //           saveToFavorite(
                    //               context: myFavorite,
                    //               idCourse: widget.ebookId.toString(),
                    //               idUser: id),
                    //
                    //
                    //         ),
                    //
                    //         context: context,
                    //       ).then((value) async{
                    //         preferences = await SharedPreferences.getInstance();
                    //         dynamic fav = preferences.get('saveFavorite');
                    //         controller.manageFavorite(widget.ebookId);
                    //         controller.manageFavorite(widget.ebookId);
                    //
                    //
                    //         setState(() {
                    //           checkFavorite = fav;
                    //           controller.manageFavorite(widget.ebookId);
                    //
                    //         });
                    //       });
                    //     },
                    //     child: controller.isFavorite(widget.ebookId) ? Icon(
                    //       Icons.bookmark, color: Colors.blue, size: 21.sp,
                    //     ) : Icon(
                    //       Icons.bookmark_outline,color: Colors.blue, size: 21.sp,
                    //     ),
                    // ),

                    /*


                    // checkFavorite == "notfound" ? createButton(
                    //     icon: Icon(Icons.favorite_outline,color: Colors.red,),
                    //     text: 'FAVORITE',
                    //     color: Colors.pink.shade700
                    // ) : createButton(
                    //     icon: Icon(Icons.favorite_outline,color: Colors.red,),
                    //     text: 'FAVORITE',
                    //     color: Colors.pink
                    // ),*/

                  ]
              )
            ],
          ),
        ),
      );




      // body:Column(
      //
      //   children: [
      //     CarouselSlider.builder(
      //       itemCount: 1,
      //       carouselController: carouselController,
      //       options: CarouselOptions(
      //
      //         autoPlay: false,
      //         enlargeCenterPage: true,
      //         enableInfiniteScroll: false,
      //
      //       ),
      //       itemBuilder:  (context, index,realIndex){
      //
      //         return Column(
      //
      //
      //           children: [
      //             Container(
      //                 margin: EdgeInsets.all(2),
      //                 height: 25.h,
      //                 child: Row(
      //                   children: [
      //                     ClipRRect(
      //                       borderRadius: BorderRadius.all(Radius.circular(10)),
      //                       child: Image.network(widget.imageUrl,
      //                         fit: BoxFit.cover,
      //                         width: 35.w,),
      //                     ),
      //                     SizedBox(width: 3.w,),
      //                     Flexible(
      //                       child: Column(
      //                         children: [
      //                           ReadMoreText(widget.title,style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 20,
      //                           ),
      //                             trimLines: 2,
      //                             colorClickableText: Colors.pink,
      //                             trimMode: TrimMode.Line,
      //                             trimCollapsedText: '...Read more',
      //                             trimExpandedText: ' Less',
      //                           ),
      //                           SizedBox(height: 1.2.h,),
      //                           Text('Author: ${widget.author}',
      //                             style: TextStyle(
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                             maxLines: 2,
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                           SizedBox(height: 1.2.h,),
      //                           Text('Publisher: ${widget.publisher}',
      //                             style: TextStyle(
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                             maxLines: 2,
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                           Spacer(),
      //
      //                           Row(
      //                             children: [
      //
      //
      //
      //                                   Obx(()=>
      //                                       // IconButton(
      //                                       //     onPressed: (){
      //                                       //
      //                                       //       controllerProduct.manageFavorite(widget.ebookId);
      //                                       //     },
      //                                       //     icon: controllerProduct.isFavorite(widget.ebookId)
      //                                       //         ?Icon(Icons.bookmark_outline,color: Colors.red,)
      //                                       //         : Icon(Icons.bookmark,color: Colors.blue,)
      //                                       // ),
      //                                       GestureDetector(
      //                                           onTap: () async{
      //                                             controllerProduct.manageFavorite(widget.ebookId);
      //                                             controller.manageFavorite(widget.ebookId);
      //
      //                                             await showDialog(
      //                                               builder: (myFavorite) => FutureProgressDialog(
      //                                                 saveToFavorite(
      //                                                     context: myFavorite,
      //                                                     idCourse: widget.ebookId.toString(),
      //                                                     idUser: id),
      //
      //                                               ),
      //                                               context: context,
      //                                             ).then((value) async{
      //                                               preferences = await SharedPreferences.getInstance();
      //                                               dynamic fav = preferences.get('saveFavorite');
      //                                               controllerProduct.manageFavorite(widget.ebookId);
      //                                               controller.manageFavorite(widget.ebookId);
      //
      //                                               setState(() {
      //                                                 checkFavorite = fav;
      //                                                 controllerProduct.manageFavorite(widget.ebookId);
      //                                                 controller.manageFavorite(widget.ebookId);
      //                                               });
      //                                             });
      //                                           },
      //                                           child: controllerProduct.isFavorite(widget.ebookId) ? Icon(
      //                                             Icons.bookmark_outline, color: Colors.blue, size: 21.sp,
      //                                           ) : Icon(
      //                                             Icons.bookmark,color: Colors.blue, size: 21.sp,
      //                                           )
      //                                       ),
      //                                   ),
      //
      //                               SizedBox(width: 1.w,),
      //                               Text('${widget.pages} Page',
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 15,
      //                                 ),
      //                                 maxLines: 2,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //
      //                               SizedBox(width: 1.w,),
      //                               widget.free == 1 ? Text('free',
      //                                 style: TextStyle(
      //                                     color: Colors.blue,
      //                                     fontWeight: FontWeight.w500
      //                                 ),
      //                                 maxLines: 2,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ) : Text('premuim',
      //                                 style: TextStyle(
      //                                     color: Colors.blue,
      //                                     fontWeight: FontWeight.w500
      //                                 ),
      //                                 maxLines: 1,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //
      //                               Spacer(),
      //                               GestureDetector(
      //                                 onTap: (){
      //                                   _share();
      //                                 },
      //                                 child: Icon(Icons.share,color: Colors.black,),
      //                               ),
      //                             ],
      //                           ),
      //
      //                         ],
      //                         crossAxisAlignment: CrossAxisAlignment.start ,
      //                       ),
      //                     )
      //
      //                   ],
      //                 )
      //             ),
      //
      //           ],
      //         );
      //       },
      //     ),
      //
      //     widget.status == 0 ? Container(
      //       decoration: BoxDecoration(
      //           borderRadius:BorderRadius.all(Radius.circular(10)),
      //           color: Colors.blue
      //       ),
      //       child: const Padding(
      //         padding: EdgeInsets.all(8),
      //         child: Text('Coming Soon', style: TextStyle(
      //             color: Colors.white
      //         ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //       width: MediaQuery.of(context).size.width,
      //       margin: const EdgeInsets.only(left: 14,right: 14),
      //     ) : widget.free == 1 ? GestureDetector(
      //       onTap: (){
      //         _readEbook(widget.pdf);
      //         // pushPage(context, PDFView());
      //         // Navigator.push(context, MaterialPageRoute(builder: (context) => PDF(
      //         //   swipeHorizontal: true,
      //         //   autoSpacing: false,
      //         //   fitPolicy: FitPolicy.BOTH
      //         // ).cachedFromUrl(widget.pdf ,
      //         // placeholder: (progress)=>MaterialApp(
      //         //   home: Scaffold(
      //         //     backgroundColor: Colors.white,
      //         //     body: Center(
      //         //       child: Text('$progress%'),
      //         //     ),
      //         //   ),
      //         // )
      //         // )));
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //             borderRadius:BorderRadius.all(Radius.circular(10)),
      //             color: Colors.blue
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8),
      //           child: Text('Read Ebook (Free)', style: TextStyle(
      //               color: Colors.white
      //           ),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //         width: MediaQuery.of(context).size.width,
      //         margin: const EdgeInsets.only(left: 14,right: 14),
      //       ),
      //     ) : GestureDetector(
      //       onTap: (){
      //
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //             borderRadius:BorderRadius.all(Radius.circular(10)),
      //             color: Colors.blue
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8),
      //           child: Text('Read Ebook (Premium)', style: TextStyle(
      //               color: Colors.white
      //           ),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //         width: MediaQuery.of(context).size.width,
      //         margin: const EdgeInsets.only(left: 14,right: 14),
      //       ),
      //     ),
      //
      //     SizedBox(height: 3.h,),
      //
      //     Container(
      //       padding: EdgeInsets.only(top: 3.h),
      //       margin: EdgeInsets.only(left: 14,right: 14),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         color: Colors.black12,
      //       ),
      //       child: Column(
      //         children: [
      //           ReadMoreText('Description',
      //
      //             style: TextStyle(
      //                 color: Colors.blue,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.w500
      //             ),),
      //           Html(
      //             data: widget.description,
      //
      //           ),
      //
      //         ],
      //       ),
      //     )
      //
      //     // Container(
      //     //   margin: const EdgeInsets.all(14),
      //     //   height: 25.h,
      //     //   child: Row(
      //     //
      //     //     mainAxisSize: MainAxisSize.min,
      //     //     children: [
      //     //       CarouselSlider.builder(
      //     //         itemCount: 1,
      //     //         carouselController: carouselController,
      //     //         options: CarouselOptions(
      //     //
      //     //           autoPlay: false,
      //     //           enlargeCenterPage: true,
      //     //           enableInfiniteScroll: false,
      //     //
      //     //         ),
      //     //         itemBuilder: (context, index, realIndex){
      //     //           return ClipRRect(
      //     //             borderRadius: BorderRadius.all(Radius.circular(10)),
      //     //             child: Image.network(imageUrl,
      //     //               fit: BoxFit.cover,
      //     //               width: 35.w,),
      //     //
      //     //           );
      //     //
      //     //         },
      //     //
      //     //       ),
      //     //     ],
      //     //   )
      //     // ),
      //
      //
      //
      //
      //
      //
      //   ],
      // ),


  }
  Widget createButton(
  {
  required int productId,
}
      ){
    return Obx(()=>
        ButtonTheme(
            minWidth: 160,
            height: 45,
            child: FlatButton.icon(
              onPressed: ()async{
                controller.manageFavorite(productId);
                // await showDialog(
                //
                //     builder: (myFavorite)=>FutureProgressDialog(
                //       saveToFavorite(
                //           context: myFavorite,
                //           idCourse: widget.ebookId.toString(),
                //           idUser: id
                //       ),
                //     ),
                //     context: context
                //
                // ).then((value) async{
                //   preferences = await SharedPreferences.getInstance();
                //   dynamic fav = preferences.get('saveFavorite');
                //   setState(() {
                //     checkFavorite = fav;
                //   });
                // });
              },
              icon: controller.isFavorite(productId)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_outline),
              label: Text("FAVORITE".tr,style: TextStyle(
                  color: Colors.white
              ),),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

            )
        ),
    );
  }

  _share()async{
    PackageInfo pi = await PackageInfo.fromPlatform();
    Share.share("Reading Ebook for Free on${pi.appName} '\n' Download now: https://play.google.com/store/apps/details?id=${pi.packageName} ");
  }

  _readEbook(String link){
    // return Navigator.push(context, MaterialPageRoute(builder: (context) =>
    //     PDF().cachedFromUrl(link, placeholder: (progress) =>
    //         MaterialApp(home: Scaffold(
    //           body: Center(child: Text('$progress %'),),
    //         ),)),
    // ));

    return Navigator.push(context, MaterialPageRoute(builder: (context) =>
        SfPdfViewer.network(link)
    ));
  }
}




//
//
//
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class DetailWidget extends StatefulWidget {
//   final String imageUrl;
//   final String title;
//    const DetailWidget({
//      Key? key,
//      required this.imageUrl,
//      required this.title
//    }) : super(key: key);
//
//   @override
//   State<DetailWidget> createState() => _DetailWidgetState();
// }
//
// class _DetailWidgetState extends State<DetailWidget> {
//   CarouselController carouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     String title;
//     return Stack(
//       children: [
//         CarouselSlider.builder(
//           itemCount: 1,
//           carouselController: carouselController,
//           options: CarouselOptions(
//             height: 500,
//             autoPlay: false,
//             enlargeCenterPage: true,
//             enableInfiniteScroll: false,
//
//           ),
//           itemBuilder: (context, index, realIndex){
//             return Container(
//               margin:  EdgeInsets.all(10),
//               decoration:  BoxDecoration(
//
//                 image: DecorationImage(
//                   image: NetworkImage(widget.imageUrl),
//                 ),
//               ),
//
//             );
//
//           },
//
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
//           child: Column(
//             crossAxisAlignment:CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment:MainAxisAlignment.spaceBetween ,
//                 children: [
//                   Text(title,)
//                 ],
//               )
//             ],
//           ),
//         )
//
//       ],
//     );
//   }
// }
