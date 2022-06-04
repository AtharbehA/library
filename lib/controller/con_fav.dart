

import 'package:dio/dio.dart';
import 'package:ebook_read/controller/api.dart';
import '../model/model_ebook/mode2_book.dart';
import '../model/model_ebook/model_ebook.dart';


Future<List<Model2Book>> fetchByFav(List<Model2Book> fetch,String id)async{

  var req = await Dio().get(Api().baseUrl+Api().api+Api().favorite+id);

  for(Map<String, dynamic> ebook in req.data){
    fetch.add(Model2Book(
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