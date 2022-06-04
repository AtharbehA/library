
import 'package:http/http.dart' as http;

import '../controller/api.dart';
import '../model/model_category/model_category.dart';


import 'package:http/http.dart' as http;

import '../model/model_category/id_category.dart';
import '../model/model_category/model_category.dart';
import '../model/model_ebook/model_ebook.dart';


class CategoryServices{


   static Future<List<ModelCategory>> getProduct() async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?category'));


    if(response.statusCode == 200){
      var jsonData = response.body;

      return modelCategoryFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}

class AllCategoryServices{

  static Future <List<ModelEbook>> getProduct(var catId) async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?pdf_by_cat=$catId'));


    if(response.statusCode == 200){
      var jsonData = response.body;

      return modelEbookFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}

// class CategoryServices{
//
//   static Future<List<ModelCategory>> getProduct() async{
//     var response=
//     await http.get(Uri.parse('$baseUrl/api.php?category'));
//
//
//     if(response.statusCode == 200){
//      var jsonData = response.body;
//
//      return modelCategoryFromJson(jsonData);
//     }else{
//
//       return throw Exception('Failed to load Product');
//     }
//
//   }
// }