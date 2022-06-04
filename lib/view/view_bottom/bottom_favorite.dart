import 'package:ebook_read/controller/controller_ebook_latest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller_ebook_bottomfav.dart';
import '../../controller/controller_ebook_slider.dart';


class BottomFavorite extends StatelessWidget {

  final controller = Get.put(LatestController());
  final controllerProduct = Get.put(ProductController());
  final controllerFav = Get.find<FavoritesController>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context,index){
            return build(context);
          },
          separatorBuilder: (context,index){
            return Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: 10),
    );
    //////////////////////////////////////
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white70,
    //     elevation: 0,
    //     title: Text('Favorite',style: TextStyle(
    //         color: Colors.black
    //     ),),),
    //
    //   body: Obx((){
    //     if(controller.latestList.isEmpty){
    //       return  Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const [
    //             SizedBox(height: 100,width: 100,
    //               child: Text('Please, Add Your Favorite Book',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                   fontSize: 18,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }else{
    //       return ListView.separated(
    //         itemBuilder: (context, index) {
    //           return buildFavItem(
    //               photo: controller.latestList[index].photo
    //           );
    //         },
    //         itemCount: 10,
    //         separatorBuilder: (context,  index) {
    //           return const Divider(
    //             color: Colors.grey,
    //             thickness: 1,
    //           );
    //         },
    //       );
    //     }
    //
    //   }),
    //
    //
    //
    //
    //
    // );
  }

  Widget buildFavItem({
    required String photo,

  }){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1652039033545-af28657fc7cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            const SizedBox(width: 15,),

            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('title',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Author',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),

                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.favorite,
                  color: Colors.red,
                  size: 30,))
          ],
        ),
      ),


    );
  }
}


//
// class BottomFavorite extends StatefulWidget {
//   const BottomFavorite({Key? key}) : super(key: key);
//
//   @override
//   State<BottomFavorite> createState() => _BottomFavoriteState();
// }
//
// class _BottomFavoriteState extends State<BottomFavorite> {
//   // final controller = Get.find<ProductController>();
//   // final controllerFav = Get.find<FavoriteController>();
//
//   Future<List<Model2Book>>? getFva;
//   List<Model2Book> listFav=[];
//
//   String id = '', name = '', email = '', photo = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadLogin().then((value) {
//       setState(() {
//         id = value[0];
//         name = name[1];
//         email = value[2];
//          getFva = fetchByFav(listFav,id);
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text('Favorite',style: TextStyle(
//           color: Colors.red
//         ),
//         ),
//       ),
//
//       body: SingleChildScrollView(
//         child: Container(
//           child: FutureBuilder(
//             future: getFva,
//             builder: (context,AsyncSnapshot<List<Model2Book>> snapshot){
//               if(snapshot.connectionState == ConnectionState.done){
//                 return GridView.builder(
//                   scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context,index){
//                     return GestureDetector(
//                       onTap: (){
//
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(3),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(
//                                 listFav[index].photo,
//                                 fit: BoxFit.cover,
//                                 height: 15.h,
//                                 width: 15.w,
//                               ),
//                             ),
//                             SizedBox(height: 0.7,),
//                             Container(
//                               width: 24.w,
//                               child: Text(
//                                 listFav[index].title,style: TextStyle(
//                                 color: Colors.black
//                               ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//
//                   },
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 5.5 /9.0,
//                   ),
//
//                 );
//               }else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     strokeWidth: 1.5,
//                   color: Colors.blue,),
//                 );
//               }
//             },
//           )
//         ),
//       ),
//     );
//   }
// }
