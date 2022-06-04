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




import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/model_ebook/model_ebook.dart';
import '../services/product_coming_services.dart';



class ComingController extends GetxController{

  var comingtList = <ModelEbook>[].obs;
  var isLoading = true.obs;
  var newFavoritesList = <ModelEbook>[].obs;
  var storage = GetStorage();




  @override
  void onInit() {
    super.onInit();
    getComing();

  }


  void getComing()async{
    var coming=await ComingServices.getComing();


    try{
      isLoading(true);
      if(coming.isNotEmpty){
        comingtList.addAll(coming);
      }
    }
    finally{
      isLoading(false);
    }
  }
  void newManageFavorites(int productId) async{
    var existingIndex =
    newFavoritesList.indexWhere((element) => element.id == productId);

    if(existingIndex >= 0){
      newFavoritesList.removeAt(existingIndex);

      await storage.remove("isFavourites");
    }else{
      newFavoritesList
          .add( comingtList.firstWhere((element) => element.id == productId));

      await storage.write("isFavourites", newFavoritesList);


    }

  }
  bool newIsFavorites(int productId){

    return newFavoritesList.any((element) => element.id == productId);
  }

}