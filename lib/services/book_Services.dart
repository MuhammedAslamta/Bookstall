import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/model_Class.dart';


class BookServices {
  static Future<HomeModel?> getCategories() async {
    try {
      debugPrint("sent book services request",);
      var response = await http.get(
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=flutter"),
      );
      debugPrint("sent book status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        debugPrint("sent book services Response : ${response.body.toString()}");
        return HomeModel.fromJson(responseJson);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}