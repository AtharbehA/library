//
//
// import 'package:dio/dio.dart';
// import 'package:ebook/controller/api.dart';
// import 'package:ebook/model/model_ebook/model_ebook.dart';
//
// Future<List<ModelEbook>> fetchEbook(List<ModelEbook> fetch) async{
//
//   var request = await Dio().get(Api().baseUrl+Api().api+Api().latest);
//
//   for(Map<String ,dynamic>ebook in request.data){
//
//     fetch.add(
//       ModelEbook(
//         id: ebook['id'],
//         title: ebook['title'],
//         photo: ebook['photo'],
//         description: ebook['description'],
//         catId: ebook['catId'],
//         statusNews: ebook['statusNews'],
//         pdf: ebook['pdf'],
//         data: ebook['data'],
//         authorName: ebook['authorName'],
//         publisherName: ebook['publisherName'],
//         page: ebook['page'],
//         language: ebook['page'],
//         rating: ebook['rating'],
//         free: ebook['free'],
//
//       )
//     );
//   }
//   return fetch;
// }



import '../model/model_ebook/model_ebook.dart';

import 'package:get/get.dart';

import '../services/product_favorite_services.dart';
import '../services/product_latest_services.dart';

class FavoritesController extends GetxController{

  var favoriteList = <ModelEbook>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
  }


  void getFavorite(int id)async{
    var product=await FavoriteSer.getFavorite(id);


    try{
      isLoading(true);
      if(product.isNotEmpty){
        favoriteList.addAll(product);
      }
    }
      finally{
      isLoading(false);
    }
  }
  void manageFavorite(int productId){
    favoriteList
        .add( favoriteList.firstWhere((element) => element.id == productId)
    );
  }

  bool isFavorite(int productId){

    return favoriteList.any((element) => element.id == productId);
  }
}