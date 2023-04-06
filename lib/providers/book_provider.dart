import 'package:flutter/cupertino.dart';
import 'package:nextger/services/book_Services.dart';

import '../models/model_Class.dart';


class BookProvider extends ChangeNotifier{
  HomeModel? homeModel;
  bool inProgress = false;
  Items? selectedItem;
  List<Items> wishList = [];

  removeWishList(){
    wishList = [];
    notifyListeners();
  }
  setShimmer(bool value){
    inProgress = value;
    notifyListeners();
  }

  initialiseWishList(){
    wishList = [];
  }
  setWishList(Items items) async {
    wishList!.add(items);
    notifyListeners();
  }

  getSelectedData(Items items){
    selectedItem = items;
    notifyListeners();
  }

  fetchBooks() {
    setShimmer(true);
    BookServices.getCategories().then((value){
      homeModel = value;
      setShimmer(false);
    });
  }
}