
// To parse this JSON data, do
//
//     final categoryId = categoryIdFromJson(jsonString);

import 'dart:convert';

List<String> categoryIdFromJson(String str)
=> List<String>.from(json.decode(str).map((x) => x));

String categoryIdToJson(List<String> data)
=> json.encode(List<dynamic>.from(data.map((x) => x)));
