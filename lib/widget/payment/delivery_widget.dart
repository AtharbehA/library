

import 'package:ebook_read/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../controller/payment_controller.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key,
    }) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {

  final TextEditingController phoneController = TextEditingController();

  int radioContainerIndex = 1;
  bool cahngeColors = false;

  final controller = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Jordan,Irbid',
          name: 'Ebook Library',
          phone: '792380449',
          title: 'Ebook Reading',
          value: 1,
          color: cahngeColors ? Colors.white :Colors.grey.shade300,
          onChanged: (int? value){
            setState(() {
              radioContainerIndex= value!;
              cahngeColors = !cahngeColors;
            });
          }, icon: Container(),
        ),
        const SizedBox(height: 10,),
        Obx(()=>
            buildRadioContainer(
                address: 'Jordan,Irbid',
                name: 'Ahmad Atharbeh',
                phone: controller.phoneNumber.value,
                title: 'Delivery',
                value: 2,
                color: cahngeColors ? Colors.grey.shade300 :Colors.white,
                onChanged: (int? value){
                  setState(() {
                    radioContainerIndex= value!;
                    cahngeColors = !cahngeColors;
                  });
                },
                icon: InkWell(
                  onTap: (){
                    Get.defaultDialog(
                        title: "Enter Your Phone Number",
                        titleStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        backgroundColor: Colors.white,
                        radius: 25,
                        textCancel: ' Cancel ',
                        confirmTextColor: Colors.black,
                        textConfirm: ' Save ',
                        cancelTextColor: Colors.black,
                        onCancel: (){
                          Get.toNamed(Routes.paymentScreen);
                        },
                        onConfirm: (){
                          Get.back();
                          controller.phoneNumber.value = phoneController.text;
                          },

                        buttonColor: Colors.blue,
                        content:  Padding(
                          padding: const EdgeInsets.all(10),
                          child:  Container(

                            height: 70,
                            child: TextField(

                              controller: phoneController,
                              style: const TextStyle(color:Colors.black,
                              overflow: TextOverflow.ellipsis),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              onSubmitted: (value){
                                phoneController.text = value;
                              },

                              decoration:  InputDecoration(
                                fillColor: Colors.blue.withOpacity(0.2),
                                focusColor: Colors.red,
                                prefixIcon: const Icon(Icons.phone,
                                  color: Colors.blue,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    phoneController.clear();
                                  },
                                  icon: Icon(Icons.close,
                                    color: Colors.black,),
                                ),
                                hintText: "Enter Your Phone Number ",
                                hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedErrorBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),

                            ),
                          ),

                        ),


                    );
                  },
                  child: const Icon(Icons.contact_phone,
                    color: Colors.blue,
                    size: 20

                    ,),
                )
            ),
        ),

      ],
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
