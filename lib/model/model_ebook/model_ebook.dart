// To parse this JSON data, do
//
//     final modelEbook = modelEbookFromJson(jsonString);

import 'dart:convert';

List<ModelEbook> modelEbookFromJson(String str) => List<ModelEbook>.from(json.decode(str).map((x) => ModelEbook.fromJson(x)));

String modelEbookToJson(List<ModelEbook> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelEbook {
  ModelEbook({
    required this.id,
    required this.title,
    required this.photo,
    required this.description,
    required this.catId,
    required this.statusNews,
    required this.pdf,
    required this.date,
    required this.authorName,
    required this.publisherName,
    required this.pages,
    required this.language,
    required this.rating,
    required this.free,
  });

  int id;
  String title;
  String photo;
  String description;
  int catId;
  int statusNews;
  String pdf;
  DateTime date;
  String authorName;
  String publisherName;
  int pages;
  String language;
  int rating;
  int free;

  factory ModelEbook.fromJson(Map<String, dynamic> json) => ModelEbook(
    id: json["id"],
    title: json["title"],
    photo: json["photo"],
    description: json["description"],
    catId: json["cat_id"],
    statusNews: json["status_news"],
    pdf: json["pdf"],
    date: DateTime.parse(json["date"]),
    authorName: json["author_name"],
    publisherName: json["publisher_name"],
    pages: json["pages"],
    language: json["language"],
    rating: json["rating"],
    free: json["free"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "photo": photo,
    "description": description,
    "cat_id": catId,
    "status_news": statusNews,
    "pdf": pdf,
    "date": date.toIso8601String(),
    "author_name": authorName,
    "publisher_name": publisherName,
    "pages": pages,
    "language": language,
    "rating": rating,
    "free": free,
  };
}
