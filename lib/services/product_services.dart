
import 'package:ebook_read/controller/api.dart';
import 'package:http/http.dart' as http;

import '../model/model_ebook/model_ebook.dart';


class ProductServices{

  static Future <List<ModelEbook>> getProduct() async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?slider'));


    if(response.statusCode == 200){
     var jsonData = response.body;

     return modelEbookFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}
class AllFavoriteServices{

  static Future <List<ModelEbook>> getProduct(var id) async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?favorite=$id'));


    if(response.statusCode == 200){
      var jsonData = response.body;

      return modelEbookFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}
