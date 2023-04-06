



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextger/models/model_Class.dart';
import 'package:nextger/providers/book_provider.dart';
import 'package:nextger/screens/wish_list_screen.dart';
import 'package:provider/provider.dart';



class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    // getData();
  }

  // Future<void> getData() async {
  //   var url = Uri.parse(
  //       ' https://www.googleapis.com/books/v1/volumes?q=flutter');
  //   var response = await http.get(url);
  //   print(response.statusCode);
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       var data = jsonDecode(response.body);
  //       // print(data.map((e) => e.totalItems+"212121212121212"));
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<BookProvider>(
            builder: (context,data,_) {
              return
                   SingleChildScrollView(
                     child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                       child: ListView(
                         children: [
                           SizedBox(height: 70,),
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0,right: 20),
                             child: Container(
                               height: 250,
                               width: 150,
                               decoration: BoxDecoration(
                                   color: Colors.brown,
                                   image: DecorationImage(

                                       fit: BoxFit.fill, image: NetworkImage(data.selectedItem!.volumeInfo!.imageLinks!.thumbnail!)),
                                   // color: Colors.green.shade100,
                                   borderRadius: BorderRadius.circular(20)),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 60.0,right: 60,top: 25),
                             child: InkWell(
                                 onTap: (){
                                   data.setWishList(data.selectedItem!);
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => WishListScreen(),));
                                 },
                                 child: Container(
                                     height: 30,width: 50,
                                     decoration: BoxDecoration(color: Colors.blue,),
                                     child: Center(child: Text("Add to favorites")))),
                           ),
                           SizedBox(height: 20,),
                           Padding(
                             padding: EdgeInsets.only(left: 25,right: 25,top: 10),
                               child: Column(
                                 children: [
                                   Text(data.selectedItem!.volumeInfo!.description!),
                                   SizedBox(height: 5,),
                                   Text("Other Details",style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text("Published Date: "+data.selectedItem!.volumeInfo!.publishedDate!),
                                   Text("Content version: "+data.selectedItem!.volumeInfo!.contentVersion!),
                                   SizedBox(height: 40,),

                                 ],
                               )),
                         ],
                       ),
                     ),
                   );
                  },
                ),
      ),
    );
  }

}



