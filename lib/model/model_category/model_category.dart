// To parse this JSON data, do
//
//     final modelCategory = modelCategoryFromJson(jsonString);

import 'dart:convert';

List<ModelCategory> modelCategoryFromJson(String str) => List<ModelCategory>.from(json.decode(str).map((x) => ModelCategory.fromJson(x)));

String modelCategoryToJson(List<ModelCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCategory {
  ModelCategory({
    required this.catId,
    required this.photoCat,
    required this.name,
    required this.status,
  });

  int catId;
  String photoCat;
  String name;
  int status;

  factory ModelCategory.fromJson(Map<String, dynamic> json) => ModelCategory(
    catId: json["cat_id"],
    photoCat: json["photo_cat"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "photo_cat": photoCat,
    "name": name,
    "status": status,
  };
}
