
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart'as http;

import '../../controller/api.dart';
import '../../routes/routes.dart';
import '../../widget/dark_mode.dart';
import '../../widget/language_profi_widget.dart';
import '../../widget/shared_common.dart';
import '../../widget/subscrib_profile_widget.dart';
import '../screen/about_screen.dart';
import '../screen/connect_screen.dart';
import '../screen/login_screen.dart';

class BottomProfile extends StatefulWidget {
  const BottomProfile({Key? key}) : super(key: key);

  @override
  State<BottomProfile> createState() => _BottomProfileState();
}

class _BottomProfileState extends State<BottomProfile> {


  String id='',name ='', email ='', photoUser = '';
  late SharedPreferences preferences;

  File _file = File('');
  final picker = ImagePicker();


  Future updatePhotoUser() async{
    var req = http.MultipartRequest('POST',Uri.parse('$baseUrl/utils/updatephoto.php'));

    req.fields['iduser'] = id;
    var photo = await http.MultipartFile.fromPath('photo', _file.path);

    req.files.add(photo);
    var response = await req.send();

    if(response.statusCode == 200){
      setState(() {
        _file = File('');
      });
      displayPhoto(id);
    }


  }

  Future displayPhoto(String userId)async{
    var request = await Dio().post('$baseUrl/utils/viewphoto.php',data: {'id':userId});
    var decode = request.data;
    if(decode != 'no_img'){
      setState(() {
        photoUser = decode;
      });
    }else{
      setState(() {
        photoUser = '';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLogin().then((value) {
      setState(() {
        id = value[0];
        name = value[1];
        email = value[2];
        displayPhoto(id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white70,
        elevation: 0,
        title: Text('Profile'.tr,style: TextStyle(
            color: Get.isDarkMode?Colors.white:Colors.black
        ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: (){
                updatePhotoUser();
              },
              child: _file.path != '' ? Center(
                child: Text('Update', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                ),),
              ) : Text('')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24,left: 10,right: 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    imagePicker(context);
                  },
                  child: Container(
                    height: 15.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        photoUser != '' ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network('$photoUser',
                            fit: BoxFit.cover,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ) : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/image/—Pngtree—e-book reader vector man contemporary_5142009.png',
                            fit: BoxFit.cover,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                        _file.path == '' ? Text('') : Text('Change to ->',style: TextStyle(
                          color: Colors.black,
                        ),),
                        _file.path == ''? Text('') : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:  _file.path == '' ? Image.asset('assets/image/—Pngtree—e-book reader vector man contemporary_5142009.png',
                              fit: BoxFit.cover,
                              width: 30.w,
                              height: 30.h,
                            ) : Image.file(_file,fit: BoxFit.cover,
                              width: 30.w,
                              height: 30.h,)
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Text(name,style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    SizedBox(width: 10,),
                    Container(
                      child: Text(email,style: TextStyle(
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
               /* Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25.sp),
                    child: Text('Ebook App Support',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14
                      ),),
                  ),
                ),*/
                DarkModeWidget(),
                const SizedBox(height: 10,),
                LanguageWidget(),
                const SizedBox(height: 10,),
                const Subscrib(),
                const SizedBox(height: 10,),
                /*Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.sp),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text('Give a Rating',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),),
                    ),
                  ),
                ),*/
               /* Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.sp),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text('Share this App',
                        style: TextStyle(
                            color: Get.isDarkMode?Colors.red:Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),),
                    ),
                  ),
                ),*/
                /*Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.sp),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text('More App',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),),
                    ),
                  ),
                ),*/


                // GestureDetector(
                //   onTap: ()async{
                //     preferences = await SharedPreferences.getInstance();
                //     preferences.remove('login');
                //     pushAndRemove(context, LogIn());
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(top: 25.sp,bottom: 10.sp),
                //     child: Text('Logout',style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 15,
                //         fontWeight: FontWeight.w600
                //     ),),
                //   ),
                //
                // ),
                Material(
                  color: Colors.transparent,

                  child: InkWell(
                    onTap: () async{
                      Get.defaultDialog(
                        title: 'LogOut From App',
                        titleStyle: const TextStyle(
                          fontSize:18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: 'Are you sure you need to logout',
                        middleTextStyle: const TextStyle(
                          fontSize:18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.grey,
                        radius: 20,
                        textCancel: 'No',
                        cancelTextColor: Colors.white,
                        textConfirm: 'Yes',
                        confirmTextColor: Colors.white,
                        onCancel: (){
                          Get.offNamed(Routes.bottomView);
                        },
                        onConfirm: ()async{
                          preferences = await SharedPreferences.getInstance();
                          preferences.remove('login');
                          pushAndRemove(context, LogIn());

                        },
                        buttonColor: Colors.blue,
                      );

                    },
                    splashColor: Colors.red[200],
                    borderRadius: BorderRadius.circular(12),
                    customBorder: const StadiumBorder(),

                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.isDarkMode?Colors.red:Colors.blue,
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text('LogOut'.tr,style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),)
                      ],
                    ),

                  ),
                ),
                const SizedBox(height: 10,),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      pushPage(context, AboutScreen());
                    },
                    splashColor: Get.isDarkMode?Colors.red[200]:Colors.blue[200],
                    borderRadius: BorderRadius.circular(12),
                    customBorder: const StadiumBorder(),

                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.isDarkMode?Colors.red:Colors.blue,
                          ),
                          child: const Icon(
                            Icons.comment,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text('About Ebook'.tr,style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),)
                      ],
                    ),

                  ),
                ),
                const SizedBox(height: 10,),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      pushPage(context, ConnectScreen());
                    },
                    splashColor: Get.isDarkMode?Colors.red[200]:Colors.green[200],
                    borderRadius: BorderRadius.circular(12),
                    customBorder: const StadiumBorder(),

                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.isDarkMode?Colors.red:Colors.green,
                          ),
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text('Contact Us'.tr,style: TextStyle(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),)
                      ],
                    ),

                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    ) ;
  }
  imageFromGallery()async{
    var imageGallery =
    await picker.pickImage(source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 100,
        maxWidth: 100
    );
    if(imageGallery != null){
      _file = File(imageGallery.path);
    }else{
      print('This File Dont hanve any data ');
    }
  }
  imageFromCamera()async{
    var imageCamera =
    await picker.pickImage(source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 100,
        maxWidth: 100
    );
    if(imageCamera != null){
      _file = File(imageCamera.path);
    }else{
      print('This File Dont hanve any data ');
    }
  }
  void imagePicker(context ){
    showModalBottomSheet(
        context:context,
        builder: (context){
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.library_add),
                  title: Text(
                    'Photo from Gallery',
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                  onTap: (){
                    imageFromGallery();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text(
                    'Photo from Camera',
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                  onTap: (){
                    imageFromCamera();
                    Navigator.pop(context);

                  },
                )
              ],
            ),
          );
        }
    );
  }
}


