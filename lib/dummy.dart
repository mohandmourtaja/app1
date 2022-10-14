import 'package:flutter/cupertino.dart';

class Category {
  String title;
  List images;
  Category({required this.title, required this.images});
}

List<Category> data = [
  Category(
    title: 'hat',
    images: [
      'img/hat1.jpg',
      'img/hat2.jpg',
      'img/hat3.jpg',
      'img/hat4.jpg',
      'img/hat5.jpg',
      'img/hat6.jpg',
    ],
  ),
  Category(
    title: 'jaket',
    images: [
      'img/jaket1.jpg',
      'img/jaket2.jpg',
      'img/jaket3.jpg',
      'img/jaket4.jpg',
      'img/jaket5.jpg',
      'img/jaket6.jpg',
    ],
  ),
  Category(
    title: 'shoes',
    images: [
      'img/shoes1.jpg',
      'img/shoes2.jpg',
      'img/shoes3.jpg',
      'img/shoes4.jpg',
      'img/shoes5.jpg',
      'img/shoes6.jpg',
    ],
  ),
  Category(
    title: 'short',
    images: [
      'img/short1.jpg',
      'img/short2.jpg',
      'img/short3.jpg',
      'img/short4.jpg',
      'img/short5.jpg',
      'img/short6.jpg',
    ],
  ),
  Category(
    title: 't-shirt',
    images: [
      'img/t-shirt1.jpg',
      'img/t-shirt2.jpg',
      'img/t-shirt3.jpg',
      'img/t-shirt4.jpg',
      'img/t-shirt5.jpg',
      'img/t-shirt6.jpg',
    ],
  ),
  Category(
    title: 'Trousers',
    images: [
      'img/Trousers1.jpg',
      'img/Trousers2.jpg',
      'img/Trousers3.jpg',
      'img/Trousers4.jpg',
      'img/Trousers5.jpg',
      'img/Trousers6.jpg',
    ],
  ),
];
