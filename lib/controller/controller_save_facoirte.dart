




import 'package:dio/dio.dart';
import 'package:ebook_read/controller/api.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widget/shared_common.dart';

saveToFavorite(
{
  required BuildContext context,
  required String idCourse,
  required String idUser
})async{
  var data = {'id_course': idCourse, 'id_user': idUser};
  var req = await Dio().
  post('$baseUrl/utils/save_favorite.php',
  data: data
  );


  var checkFav = await Dio().
  post('$baseUrl/utils/checkfav.php',
  data: data);


  if(req.data == 'success'){
    await Alert(
      context: context,
      type:  AlertType.success,
      onWillPopActive: true,
      title: 'Added to Favorite',
      desc: 'This Ebook was added to you Favorite',
      style: AlertStyle(
        animationType: AnimationType.fromBottom,
        backgroundColor: Colors.white,
        titleStyle: TextStyle(
          color: Colors.black
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
              borderRadius: BorderRadius.circular(7),
              border:
              Border.all(color: Colors.blueAccent,width: 1),

            ),
            child: Center(
              child: Text('Okay',style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),),
            ),
          ),
          onPressed: (){
            Navigator.pop(context);

            saveFavoriteEbook(checkFav.data);
          },
          width: 100,
        )
      ]
    ).show();
  }else{
    await Alert(
        context: context,
        type:  AlertType.warning,
        onWillPopActive: true,
        title: 'Delete from Favorite',
        desc: 'This Ebook was delete to you Favorite',
        style: AlertStyle(
            animationType: AnimationType.fromBottom,
            backgroundColor: Colors.white,
            titleStyle: TextStyle(
                color: Colors.black
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
                borderRadius: BorderRadius.circular(7),
                border:
                Border.all(color: Colors.blueAccent,width: 1),

              ),
              child: Center(
                child: Text('Okay',style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                ),),
              ),
            ),
            onPressed: (){
              Navigator.pop(context);
              saveFavoriteEbook(checkFav.data);

            },
            width: 100,
          )
        ]
    ).show();

  }
}