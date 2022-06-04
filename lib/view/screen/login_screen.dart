import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/api.dart';
import '../../routes/routes.dart';
import '../../widget/shared_common.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visiLoading = false;


  Future login({
  required TextEditingController email ,
    required TextEditingController password,
    required BuildContext context,
    required Widget widget
})async{
    String getEmail =email.text;
    String getPassword = password.text;

    setState(() {
      visiLoading = true;
    });

    var data ={'email': getEmail , 'password':getPassword};
    var request= await Dio().post('$baseUrl/utils/login.php', data: data);

    var decode = jsonDecode(request.data);

    if(decode[4] == 'Successfully login'){
      setState(() {
        visiLoading = false;
      });
      saveLogin(
          id: decode[0],
          name: decode[1],
          email: decode[2],
          photo: ''
      );
      Get.offNamed(Routes.bottomView);

    }else{
      setState(() {
        visiLoading = false;
      });
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Please check your email and password',
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
      backgroundColor: Colors.white,

      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/image/—Pngtree—e-book reader vector man contemporary_5142009.png',
                width: 125,height: 125,),

                Text('Hello, Welcome Back', style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,

                ),),
                Container(
                  margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 7.h),

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
                    login(email: email, password: password, context: context, widget: widget);
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
                      child: Text('LogIn',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),
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
                        const Text('Dont Have an Account?',style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),),
                        const SizedBox(width:10 ,),
                        GestureDetector(
                          onTap: (){
                            Get.offNamed(Routes.singUpScreen);
                          },

                          child: const Text('Register',style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }
}
