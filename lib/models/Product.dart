import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title, description, agence, quincallerie;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final int price;
  bool isFavourite, isPopular;
  int quantity;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.quincallerie,
    required this.agence,
    required this.quantity,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      id: "1",
      images: [
        "assets/images/image1.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Parpaings oudis",
      price: 50,
      description: 'parpains de taille 25 * 20 cm, très solides et résistants',
      rating: 4.8,
      quantity: 9,
      isFavourite: true,
      isPopular: true,
      quincallerie: "ETS Lindsay",
      agence: "Essos"),
  Product(
      id: "2",
      images: [
        "assets/images/image2.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Carreau en marbre",
      price: 7000,
      description: 'description',
      rating: 4.1,
      quantity: 20,
      isPopular: true,
      quincallerie: "ETS Lindsay",
      agence: "Awae"),
  Product(
      id: "3",
      images: [
        "assets/images/image3.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Tôle baque",
      price: 12000,
      description: 'description',
      rating: 4.1,
      quantity: 12,
      isFavourite: true,
      isPopular: true,
      quincallerie: "ETS Lindsay",
      agence: "Nkomo"),
  Product(
      id: "4",
      images: [
        "assets/images/image4.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Fer à béton",
      price: 6000,
      description: 'Diamètre 50 mm',
      rating: 4.1,
      quantity: 14,
      isFavourite: true,
      quincallerie: "ETS Lindsay",
      agence: "Damas"),
  Product(
      id: "5",
      images: [
        "assets/images/Image Banner 2.jpg",
        "assets/images/Image Banner 2.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Ciment",
      price: 7500,
      description: 'Diamètre 50 mm',
      rating: 4.1,
      quantity: 9,
      isFavourite: true,
      quincallerie: "ETS Lindsay",
      agence: "Nkomo"),
];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
