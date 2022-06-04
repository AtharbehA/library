import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../controller/api.dart';
import '../../routes/routes.dart';




class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

   File _file = File('');
  final picker = ImagePicker();
   bool visiLoading = false;
   TextEditingController name = TextEditingController();
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();

  Future register({
  required TextEditingController name,
    required TextEditingController email,
    required TextEditingController password,
    required BuildContext context,
    required Widget widget,

})async{
    setState(() {
      visiLoading = true;
    });

    String getName = name.text;
    String getEmail = email.text;
    String getPassword = password.text;

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/utils/register.php'));

    var photo = await http.MultipartFile.fromPath('photo', _file.path);

    request.fields['name'] = getName;
    request.fields['email'] = getEmail;
    request.fields['password']= getPassword;
    request.files.add(photo);

    var response = await request.send();

    if(response.statusCode == 200){
      setState(() {
        visiLoading =false;
      });

      Get.offNamed(Routes.loginScreen);

      
    }else{
      setState(() {
        visiLoading =false;
      });
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Name or Email already on DataBase',
            style: TextStyle(
              color: Colors.blue,
            ),),
            actions: [
              GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: const Text('Okay'),
              )
            ],
          );
        }
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:EdgeInsets.only(top: 14.h),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              const Text('Create Your a New Account ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,

              ),
              ),

              GestureDetector(
                onTap: (){
                  imagePicker(context);
                },
                child: Container(
              margin: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _file.path == ' ' ? Image.asset('assets/image/—Pngtree—e-book reader vector man contemporary_5142009.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ): Image.file(_file,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),

                child: TextField(
                  style: TextStyle(
                    color: Colors.black
                  ),
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
                    filled: true,
                      fillColor: Colors.white70,
                      hintStyle: TextStyle(
                      color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 17),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 17),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: password,
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.password,color: Colors.black,),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  if(_file.path != ""){
                    if(name.text != ''){
                      if(email.text != ''){
                        if(password.text != ''){
                          register(
                              name: name,
                              email: email,
                              password: password,
                              context: context,
                              widget: widget
                          );
                        }else{
                          mesError('No Password', 'Please Enter Your Password');
                        }
                      }else{
                        mesError('No Email', 'please Give your Email');

                      }
                    }else{
                      mesError('No Name', 'please Enter your Name');

                    }
                  }else{
                    mesError('No Photo', 'please choose your photo');
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 17),
                  padding: EdgeInsets.only(top: 1.2.h,bottom: 1.2.h,right: 1.5.w
                  ,left: 1.5.w),
                  
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: !visiLoading ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Create Account',
                      style: TextStyle(color: Colors.white,fontSize: 17),
                      textAlign: TextAlign.center,
                        ),
                  ): Visibility(visible: visiLoading,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),),
                  
                ),

              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an Account?',style: TextStyle(
                        color: Colors.black,
                        fontSize: 17
                      ),),
                      const SizedBox(width:10 ,),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(Routes.loginScreen);
                        },

                        child: const Text('LogIn',style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,

                        ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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


  Future mesError(String title, String description){
    return Alert(
      context: context,
      type: AlertType.success,
      onWillPopActive: true,
      title: '$title',
      desc: '$description',
      style: AlertStyle(
        animationType: AnimationType.fromBottom,
        backgroundColor: Colors.white,
        titleStyle:  TextStyle(
          color: Colors.blue
        ),
        descStyle: TextStyle(
          color: Colors.black54
        )
      ),
      buttons: [
        DialogButton(
          padding: EdgeInsets.all(1),
          child: Container(
            height: 45,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black,width: 0.7),
            ),
          ),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        )
      ]
    ).show();
  }
}
