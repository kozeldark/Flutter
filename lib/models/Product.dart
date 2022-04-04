import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
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
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "템플렛 1",
      price: 234,
      size: 12,
      description: "설명1",
      image: "assets/images/video.gif",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "템플렛 2",
      price: 234,
      size: 8,
      description: "설명2",
      image: "assets/images/video1.gif",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "템플렛 3",
      price: 234,
      size: 10,
      description: "설명3",
      image: "assets/images/video2.gif",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "템플렛 4",
      price: 234,
      size: 11,
      description: "설명4",
      image: "assets/images/video3.gif",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "템플렛 5",
      price: 234,
      size: 12,
      description: "설명5",
      image: "assets/images/video4.gif",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "템플렛 6",
    price: 234,
    size: 12,
    description: "설명6",
    image: "assets/images/video5.gif",
    color: Color(0xFFAEAEAE),
  ),
];
