

import 'package:ebook_read/controller/payment_controller.dart';
import 'package:ebook_read/widget/payment/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import 'add_book_user.dart';

class SubscribeButton extends StatefulWidget {
  const SubscribeButton({Key? key}) : super(key: key);

  @override
  State<SubscribeButton> createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<SubscribeButton> {
  final TextEditingController phoneController = TextEditingController();

  int radioContainerIndex = 2;
  bool cahngeColors = false;


  final controller = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white70,
        elevation: 0,
        centerTitle: true,
        title: Text('Subscribe'.tr,style: TextStyle(
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               Text('Subscribe Library'.tr,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black
              ),
              ),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Obx(()=>
                      buildRadioContainer(
                        address: 'Jordan,Irbid'.tr,
                        name: 'Ebook Library',
                        phone: controller.phoneNumber.value,
                        title: 'Subscribe',
                        value: 1,
                        color: cahngeColors ? Colors.white :Colors.grey.shade300,
                        onChanged: (int? value){
                          setState(() {
                            radioContainerIndex= value!;
                            cahngeColors = !cahngeColors;
                          });
                        }, icon: Container(),
                      ),

                  ),
                  const SizedBox(height: 10,),

                ],
              ),
              //DeliveryContainerWidget(),
              const SizedBox(height: 20,),
               Text('Payment Method',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black
              ),
              ),
              const SizedBox(height: 20,),

              const PaymentMethodWidget(),

              const SizedBox(height: 30,),

              radioContainerIndex == 1 ?


              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      shadowColor: Get.isDarkMode?Colors.deepOrange:Colors.blue,
                      primary: Get.isDarkMode?Colors.orangeAccent:Colors.blue,
                    ),
                    onPressed: () {
                      pushPage(context, AddBookUser());
                    },
                    child: const Text(
                      'Subscriptions' ,style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.white,
                    ),),
                  ),
                ),
              )
                  : Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      shadowColor: Colors.deepOrange,
                      primary: Colors.orangeAccent,
                    ),
                    onPressed: () {
                    },
                    child:Text(
                      "Subscriptions " ,style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,

  }){
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,

            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              groupValue: radioContainerIndex,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (int ?value){
                onChanged(value);
              }
          ),

          const SizedBox(width: 10,),
          Padding(padding: const EdgeInsets.only(top: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                ),
                const SizedBox(height: 5,),
                Text(name,style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Text('🇯🇴 +962 '),
                    Text(phone,style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    ),
                    const SizedBox(width: 120,),

                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                Text(address,style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}
