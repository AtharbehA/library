



import 'package:ebook_read/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/controller_ebook_detail.dart';
import '../../controller/controller_ebook_latest.dart';
import '../../model/model_ebook/model_ebook.dart';
import '../../widget/detail_widget.dart';
class DetailScreen extends StatelessWidget {
  final ModelEbook modelEbook;
  final String imageUrl;
  final controller = Get.find<LatestController>();
   DetailScreen({
    Key? key,
    required this.modelEbook,
     required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            flexibleSpace: Container(
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: (){

                },
              )
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Get.isDarkMode?Colors.red:Colors.blue,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),


        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailWidget(
                  imageUrl: modelEbook.photo,
                title: modelEbook.title,
                author: modelEbook.authorName,
                  publisher: modelEbook.publisherName,
                pages: modelEbook.pages,
                free: modelEbook.free,
                status: modelEbook.statusNews,
                description: modelEbook.description,
                ebookId: modelEbook.id,
                catId: modelEbook.catId,
                pdf: modelEbook.pdf,
              ),
            ],
          ),


        ),
      ),
    );
  }
}

// class DetailScreen extends StatefulWidget {
//
//   final ModelEbook modelEbook;
//
//   const DetailScreen({Key? key,required this.modelEbook}) : super(key: key);
// //   int ebookId;
// //   int status;
// //   DetailScreen({Key? key,
// //     required this.ebookId,
// //     required this.status,
// // }) : super(key: key);
//
//
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }



// class _DetailScreenState extends State<DetailScreen> {
//   // final controllerDetail = Get.find<DetailController>();
//   // final controller = Get.find<ProductController>();
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //
//   //     body: SingleChildScrollView(
//   //       child: Column(
//   //         children: [
//   //            ImageSlider(
//   //                imageUrl: modelEbook.ph
//   //            ),
//   //         ],
//   //       ),
//   //
//   //
//   //     ),
//   //   );
//   // }
//   // Obx((){
//   // if(controllerDetail.isLoading.value){
//   // return  const Center(
//   // child: CircularProgressIndicator(
//   // color: Colors.red,
//   // ),
//   // );
//   // }else{
//   // return Scaffold(
//   // appBar: AppBar(
//   // backgroundColor: Colors.white70,
//   // elevation: 0,
//   // title: Text('library',style: TextStyle(
//   // color: Colors.black
//   // ),),
//   // leading: GestureDetector(
//   // onTap: ()=>Navigator.pop(context),
//   // child: Icon(Icons.arrow_back,color: Colors.black,),
//   // ),
//   // ),
//   //
//   // body: Container(
//   // child: Stack(
//   // children: [
//   // ListView.builder(
//   // itemCount: controllerDetail.detailList.length,
//   // itemBuilder: (BuildContext context, int index){
//   // return Column(
//   // children: [
//   // Container(
//   // margin: EdgeInsets.all(14),
//   // height: 24.h,
//   // child: Row(
//   // children: [
//   // ClipRRect(
//   // child: Image.network(
//   // controllerDetail.detailList[index].photo,
//   // fit: BoxFit.cover,
//   //
//   // width: 35.0.w,
//   // ),
//   // borderRadius: BorderRadius.circular(15),
//   // ),
//   // ],
//   // ),
//   // )
//   // ],
//   // );
//   // }
//   //
//   // )
//   // ],
//   // )
//   // ),
//   // );
//   //
//   // }
//   // });
// }
