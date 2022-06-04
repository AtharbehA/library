

import 'package:dio/dio.dart';
import 'package:ebook_read/controller/api.dart';
import '../model/model_ebook/model_ebook.dart';


Future<List<ModelEbook>> fetchByCategory(List<ModelEbook> fetch,int id)async{

  var req = await Dio().get('$baseUrl/api.php?pdf_by_cat=${id.toString()}');

  for(Map<String, dynamic> ebook in req.data){
    fetch.add(ModelEbook(
        id: ebook['id'],
        title: ebook['title'],
        photo: ebook['photo'],
        description: ebook['description'],
        catId: ebook['catId'],
        statusNews: ebook['statusNews'],
        pdf: ebook['pdf'],
        date: ebook['date'],
        authorName: ebook['authorName'],
        publisherName: ebook['publisherName'],
        pages: ebook['pages'],
        language: ebook['language'],
        rating: ebook['rating'],
        free: ebook['free']
    ));
  }
  return fetch;

}