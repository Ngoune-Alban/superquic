import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:superking/components/product_card.dart';
import 'package:superking/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class AvailableProduct extends StatefulWidget {
  @override
  State<AvailableProduct> createState() => _AvailableProductState();
}

class _AvailableProductState extends State<AvailableProduct> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('produits');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Produits disponibles", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (!demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Column(
          children: [
            SizedBox(
                height: 200,
                child: StreamBuilder(
                    stream: _products.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              final String id = documentSnapshot.id;
                              // this should be change
                              // final List<String> images =
                              //     documentSnapshot['images'];
                              final List<String> images = [
                                "assets/images/image1.jpg"
                              ];
                              final List<Color> colors = [
                                Color(0xFFF6625E),
                                Color(0xFF836DB8),
                                Color(0xFFDECB9C),
                                Colors.white,
                              ];
                              final String title = documentSnapshot['title'];
                              final double rating = documentSnapshot['rating'];
                              final int price = documentSnapshot['price'];
                              final bool isFavourite =
                                  documentSnapshot['isFavourite'];
                              final bool isPopular =
                                  documentSnapshot['isPopular'];
                              final String description =
                                  documentSnapshot['description'];
                              final String quincallerie =
                                  documentSnapshot['quincallerie'];
                              final String agence = documentSnapshot['agence'];
                              final Product product = new Product(
                                  id: id,
                                  images: images,
                                  colors: colors,
                                  title: title,
                                  price: price,
                                  description: description,
                                  quincallerie: quincallerie,
                                  agence: agence,
                                  isFavourite: isFavourite,
                                  isPopular: isPopular);
                              return ProductCard(product: product);
                            });
                      }
                      return const Text(
                          "Recherche des produits ..."); // this should be replace by loading button
                    }))
          ],
        ),
      ],
    );
  }
}
