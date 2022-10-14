import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List li = routeArg['img'];

    return Scaffold(
        appBar: AppBar(
          title: Text(routeArg['title']),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Slider 1 : ${routeArg['title']} Models 1 0  '),
              CarouselSlider(
                  items: [
                    Image.asset(li[0]),
                    Image.asset(li[1]),
                    Image.asset(li[2])
                  ],
                  options: CarouselOptions(
                    height: 180,
                    aspectRatio: 2.0,
                  )),
              Text('Slider 2 : ${routeArg['title']} Models 2  '),
              CarouselSlider(
                  items: [
                    Image.asset(li[3]),
                    Image.asset(li[4]),
                    Image.asset(li[5])
                  ],
                  options: CarouselOptions(
                    height: 180,
                    aspectRatio: 2.0,
                  )),
            ],
          ),
        ));
  }
}
