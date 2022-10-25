import 'package:flutter/material.dart';
class SliderDestination extends StatelessWidget {
  SliderDestination({Key? key}): super(key: key);
  List<String>_list = [
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg',
    'asset/images/luca-vFrhuBvI-hI-unsplash.jpg'

  ];
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height:  MediaQuery.of(context).size.height/3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
      child: Row(
        children: [
         ..._list.map((e){
          return Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
          image: AssetImage(e),
          fit: BoxFit.cover
          )
          ),
          );
        })
        ],
      ),
      ),
    );
  }
}