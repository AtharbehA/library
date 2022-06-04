

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller_ebook_latest.dart';
import '../pdf_by_cat/ebook_category.dart';
import 'bottom_favorite.dart';
import 'bottom_library.dart';
import 'bottom_profile.dart';
import 'home.dart';
import 'new_favorite.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);


  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final controller = Get.find<LatestController>();
  int currentIndex = 0;

  List<Widget> body = [
     Home(),
     EbookCategory(),
     BottomLibrary(),
    NewFavorite(),
    BottomProfile(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Get.isDarkMode?Colors.red:Colors.blue,
           unselectedItemColor: Get.isDarkMode?Colors.white:Colors.black,
           backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
           onTap: onTapBottomview,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items:  [

            BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Get.isDarkMode?Colors.white:Colors.black,),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category,color: Get.isDarkMode?Colors.white:Colors.black,),
                label: 'Category'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined,color: Get.isDarkMode?Colors.white:Colors.black,),
                label: 'Book'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,color:Get.isDarkMode?Colors.white:Colors.black),
                label: 'Favorite',

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined,color: Get.isDarkMode?Colors.white:Colors.black,),
                label: 'Profile'
            ),
          ],
        ),
        body: body[currentIndex],
      ),
    );
  }

  void onTapBottomview(int index){
    setState(() {
      currentIndex = index;
    });
  }
}
