
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningproject/genre_slider.dart';
import 'package:learningproject/silder_destination.dart';

class view1 extends StatelessWidget {
  const view1({Key? key}) : super(key: key);

          @override
          Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
    children: [
      SliderDestination(),
      GenreSlider(),

          blockimage()
        ],
      ),
    );
  }
  blockimage(){
    return Image.asset('assets/images/luca-vFrhuBvI-hI-unsplash.jpg');
  }
}