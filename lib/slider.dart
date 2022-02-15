import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> listImages = [
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
];

class ClassSlider extends StatelessWidget {
  const ClassSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        child: CarouselSlider(
          items: listImages
              .map(
                (item) => Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      item,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            // autoPlayAnimationDuration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
