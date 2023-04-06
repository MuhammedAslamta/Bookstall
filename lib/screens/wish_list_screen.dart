



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextger/models/model_Class.dart';
import 'package:nextger/providers/book_provider.dart';
import 'package:nextger/screens/detail_screen.dart';
import 'package:provider/provider.dart';



class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
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
      appBar: AppBar(actions: [Row(
        children: [
          Text("Wish Lists"),
          SizedBox(width:150,)
        ],
      )]),
      body: Consumer<BookProvider>(
          builder: (context,data,_) {
            return  Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: data.wishList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return productGrid(data.homeModel!.items![index]);
                },
              ),
            );
          }
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(left: 60.0,right: 60,top: 25),
        child: InkWell(
            onTap: (){
              context.read<BookProvider>().removeWishList();
            },
            child: Container(
                height: 30,width: 50,
                decoration: BoxDecoration(color: Colors.blue,),
                child: Center(child: Text("Clear favorites")))),
      ),
    );
  }

  productGrid(Items items){
    return Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Column(
                    children: [
                      Text(
                        "title: "+items.volumeInfo!.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "auth: "+items.volumeInfo!.authors!.first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      items.volumeInfo!.categories != null
                          ? items.volumeInfo!.categories!.isNotEmpty
                          ? Text(
                        "category: "+items.volumeInfo!.categories!.first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ):Container() :Container(),
                      items.volumeInfo!.publisher != null
                          ?Text(
                        "publisher: "+items.volumeInfo!.publisher!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                          :Container(),
                      SizedBox(height: 2,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(items.volumeInfo!.imageLinks!.thumbnail!)),
                  // color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: 60,),
        ]);
  }
}



