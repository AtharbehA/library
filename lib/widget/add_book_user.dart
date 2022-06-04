import 'dart:convert';
import 'dart:io';

import 'package:ebook_read/controller/api.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';



class AddBookUser extends StatefulWidget {


  @override
  State<AddBookUser> createState() => _AddBookUserState();
}

class _AddBookUserState extends State<AddBookUser> {
  TextEditingController namee = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  // TextEditingController freebook = TextEditingController();
  // TextEditingController pages = TextEditingController();
  // TextEditingController id_language = TextEditingController();
  // TextEditingController id_author = TextEditingController();
  // TextEditingController id_publisher = TextEditingController();

  List<PlatformFile>? _files;
  File _file = File('');
  final picker = ImagePicker();

  void _uploadFile({
    required TextEditingController name,
    required TextEditingController category,
    required TextEditingController description,
    required TextEditingController status,
    required TextEditingController freebook,
    required TextEditingController pages,
    required TextEditingController id_language,
    required TextEditingController Author,
    required TextEditingController Publisher,
    required BuildContext context,
    required Widget widget,

}) async {
    String getName = name.text;
    String getcategory = category.text;
    String getdescription = description.text;
    String getstatus = status.text;
    String getfreebook = freebook.text;
    String getpages = pages.text;
    String getid_language = id_language.text;
    String getAuthor = Author.text;
    String getPublisher = Publisher.text;

    var req = http.MultipartRequest('POST',Uri.parse('$baseUrl/action/add_ebook.php'));
    var photo = await http.MultipartFile.fromPath('photo', _file.path);

    req.fields['name'] = getName;
    req.fields['cat_news'] = getcategory;
    req.fields['description'] = getdescription;
    req.fields['status'] = getstatus;
    req.fields['freebook'] = getfreebook;
    req.fields['pages'] = getpages;
    req.fields['id_language'] = getid_language;
    req.fields['id_author'] = getAuthor;
    req.fields['id_publisher'] = getPublisher;

    req.files.add(photo);

    var res = await req.send();

    if(res.statusCode == 200) {
      print('Uploaded  *********...');
    } else {
      print('Something went wrong! ***************');
    }

    var uri = Uri.parse('$baseUrl/action/add_ebook.php');
    var request = http.MultipartRequest('POST', uri);
    var pdf = await http.MultipartFile.fromPath('sample', _file.path);
    request.files.add(pdf);
    request.files.add(await http.MultipartFile.fromPath('sample', _files!.first.path.toString()));
    var response = await request.send();
    if(response.statusCode == 200) {
      print('Uploaded ...');
    } else {
      print('Something went wrong!');
    }

  }

  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        allowedExtensions: null
    ))!.files;

    print('Loaded file path is : ${_files!.first.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,

      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        centerTitle: true,
        title: Text('File Upload',style: TextStyle(
          color: Get.isDarkMode?Colors.white:Colors.black
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GestureDetector(
              //   onTap: (){
              //     imagePicker(context);
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
              //     width: 130,
              //     height: 130,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle
              //     ),
              //     child: ClipRRect(
              //         borderRadius: BorderRadius.circular(100),
              //         child: _file.path == ' ' ? Image.asset('assets/image/choose-2-icon.png',
              //           width: 30,
              //           height: 30,
              //           fit: BoxFit.cover,
              //         ): Image.file(_file,
              //           width: 30,
              //           height: 30,
              //           fit: BoxFit.cover,
              //         )
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: namee,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.account_circle_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.email_outlined,color: Get.isDarkMode?Colors.red:Colors.blue),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: subject,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Subject',
                    prefixIcon: Icon(Icons.subject,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),

                child: TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  controller: message,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Message',
                    prefixIcon: Icon(Icons.message_outlined,color: Get.isDarkMode?Colors.red:Colors.blue,),
                    filled: true,
                    fillColor: Colors.white70,
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Get.isDarkMode?Colors.red:Colors.blue)
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),
              //
              //   child: TextField(
              //     style: TextStyle(
              //         color: Colors.black
              //     ),
              //     controller: freebook,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your freebook',
              //       prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
              //       filled: true,
              //       fillColor: Colors.white70,
              //       hintStyle: TextStyle(
              //           color: Colors.black
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),
              //
              //   child: TextField(
              //     style: TextStyle(
              //         color: Colors.black
              //     ),
              //     controller: pages,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your pages',
              //       prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
              //       filled: true,
              //       fillColor: Colors.white70,
              //       hintStyle: TextStyle(
              //           color: Colors.black
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),
              //
              //   child: TextField(
              //     style: TextStyle(
              //         color: Colors.black
              //     ),
              //     controller: id_language,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your id_language',
              //       prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
              //       filled: true,
              //       fillColor: Colors.white70,
              //       hintStyle: TextStyle(
              //           color: Colors.black
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),
              //
              //   child: TextField(
              //     style: TextStyle(
              //         color: Colors.black
              //     ),
              //     controller: id_author,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your Author',
              //       prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
              //       filled: true,
              //       fillColor: Colors.white70,
              //       hintStyle: TextStyle(
              //           color: Colors.black
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 20,left: 20,bottom: 5,top: 5),
              //
              //   child: TextField(
              //     style: TextStyle(
              //         color: Colors.black
              //     ),
              //     controller: id_publisher,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your Publisher',
              //       prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
              //       filled: true,
              //       fillColor: Colors.white70,
              //       hintStyle: TextStyle(
              //           color: Colors.black
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.blue)
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(onPressed: _openFileExplorer, child: Text('Open File Explorer'),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode?Colors.red:Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              ),
              ElevatedButton(onPressed: (){
                sendEmail();

                // _uploadFile(
                //     name: namee,
                //     category: category,
                //     description: description,
                //     status: status,
                //     freebook: freebook,
                //     pages: pages,
                //     id_language: id_language,
                //     Author: id_author,
                //     Publisher: id_publisher,
                //     context: context,
                //     widget: widget);
              },
                  child: Text('Upload File'),
                  style: ElevatedButton.styleFrom(
                  primary: Get.isDarkMode?Colors.red:Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
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

  Future sendEmail(

) async{
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final serviceId = 'service_v6rzwu6';
    final templateId = 'template_9fkh0hk';
    final userId = '8rMWbgaWsWiI6MTzk';

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': namee.text,
          'subject': subject.text,
          'message': message.text,
          "user_email": email.text,
        }
      }),

    );
    return response.statusCode; 
    print(response.body);
  }


}