library cart;

import 'dart:html';

import 'package:learningproject/model/CartModel.dart';
import 'package:learningproject/model/ProductModel.dart';

List<cartItem> list = [];

void add(ProductModel product,int sl){
  cartItem cart = new cartItem(model: product,quantity: sl);
  for(int i=0;i<list.length;i++){
    if(product.id==list[i].model.id){
      list[i].quantity+=sl;
      return;
    }
  }
  list.add(cart);
}
double total(){
  double tong=0;
  for(int i=0;i<list.length;i++){
    tong+=list[i].quantity*list[i].model.price;
  }
  return tong;
}