import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Contact Us'.tr,style: TextStyle(
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
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   child: Image.asset('assets/image/back2.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),

          SingleChildScrollView(

            child: Column(
              children: [
                Container(
                  child: Text('call us For all general inquiries, call the customer support line and speak to an E-Library staff member at',
                    style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w400
                    ),),
                ),
                SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('E-mail: bakhazaleh@yahoo.com',style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.blue,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call,color: Get.isDarkMode?Colors.red:Colors.green,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('Tel: 00962796020773',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.green,
                        fontSize: 17,
                      ),),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('E-mail: atharbehahmed@gmail.com',style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call,color: Get.isDarkMode?Colors.red:Colors.green,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('Tel: 00962792380449',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 17,
                      ),),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('E-mail: laith_z_alqudah99@yahoo.com',style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call,color: Get.isDarkMode?Colors.red:Colors.green,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('Tel: 00962798151409',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 17,
                      ),),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('E-mail: ahmadimari@yahoo.com',style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call,color: Get.isDarkMode?Colors.red:Colors.green,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text('Tel: 009627555640773',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 17,
                      ),),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Container(
                  child: Text('Send us your feedback via email or WhatsApp We do not respond to unsolicited direct marketing messages, inquiries or spam emails.',
                    style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w400
                    ),),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(' Addresses for inquiries \n rbid \n 2nd Floor \n Library \n 24-26 Street \n Library Services Department \n Mafraq \n  3nd Floor \n 27 -26 Street',
                        style: TextStyle(
                            color: Get.isDarkMode?Colors.white:Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
