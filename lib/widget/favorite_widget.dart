
import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String publisher;
  final int pages;
  final int free;
  final int status;
  final String description;
  final int ebookId;
  const FavoriteWidget({Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.publisher,
    required this.pages,
    required this.free,
    required this.status,
    required this.description,
    required this.ebookId

  }) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  String id = '', name = '', email='', checkFavorite = '0';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
