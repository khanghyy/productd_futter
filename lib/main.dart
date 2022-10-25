
import 'package:flutter/material.dart';
import 'package:learningproject/Food.dart';
import 'package:learningproject/Form.dart';
import 'package:learningproject/destiantion.dart';
import 'package:learningproject/food_page.dart';
import 'package:learningproject/product_detail.dart';
import 'package:learningproject/product_pages.dart';
import 'package:learningproject/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ProductProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            home: ProductPages()
        ),
      )
  );
}