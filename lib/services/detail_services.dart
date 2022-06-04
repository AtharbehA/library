
import 'package:http/http.dart' as http;

import '../controller/api.dart';
import '../model/model_ebook/model_ebook.dart';


class DetailServices{

  static Future <List<ModelEbook>> getProduct() async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?pdf_by_id'));


    if(response.statusCode == 200){
     var jsonData = response.body;

     return modelEbookFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}