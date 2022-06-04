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




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/model_ebook/model_ebook.dart';
import '../services/product_latest_services.dart';

class LatestController extends GetxController{

  var latestList = <ModelEbook>[].obs;
  var favoriteList = <ModelEbook>[].obs;
  var isLoading = true.obs;

  var newFavoritesList = <ModelEbook>[].obs;
  var storage = GetStorage();

  //Search
  var searchList = <ModelEbook>[].obs;
  TextEditingController searchTextController = TextEditingController();



  @override
  void onInit() {
    super.onInit();


    List ? stoargeFavourites= storage.read<List>("isFavourites");
    if(stoargeFavourites != null){
      newFavoritesList =stoargeFavourites.map((e) =>
          ModelEbook.fromJson(e))
          .toList()
          .obs;
    }

    getLatest();

  }


  void getLatest()async{
    var product=await LatestServices.getLatest();


    try{
      isLoading(true);
      if(product.isNotEmpty){
        latestList.addAll(product);
      }
    }
      finally{
      isLoading(false);
    }
  }

  // Logic for Favorite,
void manageFavorite(int productId){
    favoriteList
        .add( latestList.firstWhere((element) => element.id == productId)
    );
}

bool isFavorite(int productId){

    return favoriteList.any((element) => element.id == productId);
}




  void newManageFavorites(int productId) async{
   var existingIndex =
   newFavoritesList.indexWhere((element) => element.id == productId);

   if(existingIndex >= 0){
     newFavoritesList.removeAt(existingIndex);

     await storage.remove("isFavourites");
   }else{
     newFavoritesList
         .add( latestList.firstWhere((element) => element.id == productId));

        await storage.write("isFavourites", newFavoritesList);


   }

  }
  bool newIsFavorites(int productId){

    return newFavoritesList.any((element) => element.id == productId);
  }


  //search Logic

void addSearchToList(String searchName){

  searchName = searchName.toLowerCase();


    searchList.value = latestList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchAuthor = search.authorName.toLowerCase();

      return searchTitle.contains(searchName)
          || searchAuthor.contains(searchName);
    }).toList();

    update();
}

void clearSearch(){

    searchTextController.clear();
    addSearchToList("");
}


}