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

import '../model/model_category/model_category.dart';
import '../model/model_ebook/model_ebook.dart';
import '../services/product_category_services.dart';


// class CategoryController extends GetxController{
//
//   var categoryNameList = <String>[].obs;
//   var isCategoryLoading = false.obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }
//
//   void getCategory() async{
//     var name = await CategoryServices.getProduct();
//
//
//
//     try{
//       isCategoryLoading(false);
//       if(name.isEmpty){
//         categoryNameList.addAll();
//       }
//     }finally{
//       isCategoryLoading(false);
//     }
//
//   }
//
// }

class CategoryController extends GetxController{

  var categoryList = <ModelCategory>[].obs;
  var categoryAllList = <ModelEbook>[].obs;
  var isLoading = true.obs;
  var isAllCategory= false.obs;


  @override
  void onInit() {
    super.onInit();
    getCategory();

  }


  void getCategory()async{
    var product=await CategoryServices.getProduct();


    try{
      isLoading(true);
      if(product.isNotEmpty){
        categoryList.addAll(product);
      }
    }
    finally{
      isLoading(false);
    }
  }

  /************************************************/

   getAllCategory(var catId)async{
    isAllCategory(true);

    categoryAllList.value =
    await AllCategoryServices.getProduct(catId);



      isAllCategory(false);

  }

  getCategoryIndex(int index) async{
    var product=
    await getAllCategory(categoryList[index].catId);

    if(product != null){
      categoryAllList.value = product;
    }


  }

}