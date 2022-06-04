
import 'package:ebook_read/controller/api.dart';
import 'package:http/http.dart' as http;

import '../model/model_ebook/model_ebook.dart';


class ComingServices{

  static Future <List<ModelEbook>> getComing() async{
    var response=
    await http.get(Uri.parse('$baseUrl/api.php?coming'));


    if(response.statusCode == 200){
     var jsonData = response.body;

     return modelEbookFromJson(jsonData);
    }else{

      return throw Exception('Failed to load Product');
    }

  }
}