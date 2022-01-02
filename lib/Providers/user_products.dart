import 'package:flutter/cupertino.dart';

class UserProducts with ChangeNotifier{
  List<String> _items = [];
  List<String> get items => [..._items];

  void addUserProduct({ required String id}){
    _items.add(id);
    notifyListeners();
  }
  void deleteUserProduct({required String id}){
    _items.remove(id);
    notifyListeners();
  }
}