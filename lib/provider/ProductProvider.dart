import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learningproject/model/ProductModel.dart';
class ProductProvider extends ChangeNotifier{
  List<ProductModel> list = [];
  Future<void> getList() async {
    String apiUrl = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var newListObject = jsonObject as List;
    list = newListObject.map((e){
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
  }

  void search(String searchInput){
  list=list.where((element)=>element.title.toString().toLowerCase().contains(searchInput.toLowerCase())).toList();
}
}