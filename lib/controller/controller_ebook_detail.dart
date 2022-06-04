// //
// //
// // import 'package:dio/dio.dart';
// // import 'package:ebook/controller/api.dart';
// // import 'package:ebook/model/model_ebook/model_ebook.dart';
// //
// // Future<List<ModelEbook>> fetchEbook(List<ModelEbook> fetch) async{
// //
// //   var request = await Dio().get(Api().baseUrl+Api().api+Api().latest);
// //
// //   for(Map<String ,dynamic>ebook in request.data){
// //
// //     fetch.add(
// //       ModelEbook(
// //         id: ebook['id'],
// //         title: ebook['title'],
// //         photo: ebook['photo'],
// //         description: ebook['description'],
// //         catId: ebook['catId'],
// //         statusNews: ebook['statusNews'],
// //         pdf: ebook['pdf'],
// //         data: ebook['data'],
// //         authorName: ebook['authorName'],
// //         publisherName: ebook['publisherName'],
// //         page: ebook['page'],
// //         language: ebook['page'],
// //         rating: ebook['rating'],
// //         free: ebook['free'],
// //
// //       )
// //     );
// //   }
// //   return fetch;
// // }
//
//
//
//
// import 'package:ebook/model/model_ebook/model_ebook.dart';
// import 'package:ebook/services/detail_services.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ebook/view/detail_view/detaill_view.dart';
//
//
//
//
// class DetailController extends GetxController{
//
//   var detailMap = {}.obs;
//
//   void addDetail(ModelEbook ebook){
//     if(detailMap.containsKey(ebook)){
//
//       detailMap[ebook] = 1;
//     }else{
//       detailMap[ebook] = 1;
//     }
//   }
//
//
//
//   //Map<dynamic,dynamic> detailMap ={};
//
// }