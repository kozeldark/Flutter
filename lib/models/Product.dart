import 'package:flutter/material.dart';

class Product {
  final String image, title, description, type; //type = mp4,gif
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.type,
  });
}
//mp4 는 이미지가 아니여서 보이게 할때는 gif로 보이게 해두었습니다.

List<Product> products = [
  Product(
    id: 1,
    title: "템플렛 1",
    price: 1,
    size: 12,
    description: "설명1",
    image: "assets/images/video.gif",
    color: Color(0xFF3D82AE),
    type: "GIF",
  ),
  Product(
    id: 2,
    title: "템플렛 2",
    price: 2,
    size: 8,
    description: "설명2",
    image: "assets/images/video1.gif",
    color: Color(0xFFD3A984),
    type: "GIF",
  ),
  Product(
    id: 3,
    title: "템플렛 3",
    price: 3,
    size: 10,
    description: "설명3",
    image: "assets/images/video2.gif",
    color: Color(0xFF989493),
    type: "GIF",
  ),
  Product(
    id: 4,
    title: "템플렛 4",
    price: 4,
    size: 11,
    description: "설명4",
    image: "assets/images/video3.gif",
    color: Color(0xFFE6B398),
    type: "GIF",
  ),
  Product(
    id: 5,
    title: "템플렛 5",
    price: 5,
    size: 12,
    description: "설명5",
    image: "assets/images/video4.gif",
    color: Color(0xFFFB7883),
    type: "GIF",
  ),
  Product(
    id: 6,
    title: "템플렛 6",
    price: 6,
    size: 12,
    description: "설명6",
    image: "assets/images/video5.gif",
    color: Color(0xFFAEAEAE),
    type: "GIF",
  ),
  Product(
    id: 7,
    title: "템플렛 7",
    price: 7,
    size: 12,
    description: "설명7",
    image: "assets/images/video1.gif", //실제는 mp4
    color: Color(0xFFAEAEAE),
    type: "MP4",
  ),
];
