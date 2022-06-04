import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('About EBook'.tr,style: TextStyle(
            color: Get.isDarkMode?Colors.white:Colors.black,
            fontSize: 25
        ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,color: Get.isDarkMode?Colors.white:Colors.black,
          ),
        ),
      ),
      
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/image/library.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: Container(
                color: Colors.black.withOpacity(0.6),
                height: double.infinity,
                width: double.infinity,
              )
          ),
          Positioned(
            bottom: 0,top: 0,right: 0,left: 0,
            child: Center(
              child: Text('Our library "E-Library" was established \n in 2022,and it came based on the idea of \n a graduation project in  software engineering,\n dedicated to improving society by \n providing books, magazines and novels at \n the lowest  possible prices and conducting \n scientific and social  research.\n We believe in changing society for  the better\n through education, research, scholarship,\n and books. \n Our ultimate goal is to create a better world \n of science, education, lasting peace, \n prosperity and universal rights for all.'
                ,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
            ),
          )
        ],
      ),

       /* Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Our library "E-Library" was established \n in 2022,and it came based on the idea of \n a graduation project in  software engineering,\n dedicated to improving society by \n providing books, magazines and novels at \n the lowest  possible prices and conducting \n scientific and social  research.\n We believe in changing society for  the better\n through education, research, scholarship,\n and books. \n Our ultimate goal is to create a better world \n of science, education, lasting peace, \n prosperity and universal rights for all.'
          ,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
        ],
      ),*/
    );
  }
}
