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

import '../model/model_ebook/model_ebook.dart';
import '../services/product_services.dart';



class ProductController extends GetxController{

  var productList = <ModelEbook>[].obs;
  var favoriteList = <ModelEbook>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    getProduct();

  }


  void getProduct()async{
    var product=await ProductServices.getProduct();


    try{
      isLoading(true);
      if(product.isNotEmpty){
        productList.addAll(product);
      }
    }
    finally{
      isLoading(false);
    }
  }

  void manageFavorite(int productId){
    favoriteList
        .add( productList.firstWhere((element) => element.id == productId)
    );
  }

  bool isFavorite(int productId){

    return favoriteList.any((element) => element.id == productId);
  }
}