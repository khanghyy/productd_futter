import 'dart:html';

import 'package:flutter/material.dart';
class FoodPage extends StatefulWidget {
   FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<String> list=[
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg'
  ];
  bool showGrid=true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(context),
            SizedBox(height: 20,),
            buildWelcome(context),
            SizedBox(height: 20,),
            buildSearch(context),
            SizedBox(height: 40,),
            buildSavePlace(context),
            SizedBox(height: 10,),
            //buildGrid(context)
            showGrid?buildGrid(context):buildList(context),
          ],
        ),
      ),
    ),
    );
  }

  buildTitle(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
      IconButton(onPressed: (){}, icon: Icon(Icons.extension)),
    ],


    );
  }

  buildWelcome(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:"Welcome,",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(
          text:"\nCharlie",
          style:TextStyle(
              fontWeight:FontWeight.normal
          )
          )
        ]
      ),
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
         borderRadius: BorderRadius.all(Radius.circular(10)),

        )
      ),
    );
  }

  buildSavePlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Saved Places",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
        ),
        Row(
          children: [
            IconButton(onPressed:(){
              setState(() {
                showGrid=true;
              });
            }, icon:Icon(Icons.grid_3x3,size: 30,)),
            IconButton(onPressed:(){
              setState(() {
                showGrid=false;
              });
            }, icon:Icon(Icons.list)),

          ],
        )
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
         ...list.map((e){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(e),
                fit:BoxFit.cover
              )
            ),
          );
         }).toList()
       ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...list.map((e){
            return Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e)
              ),
            ),
            );
          }).toList()
        ],
      ),
    );
  }
}

