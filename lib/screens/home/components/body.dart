import 'package:flutter/material.dart';
import 'package:superking/screens/home/components/available_product.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  // static String searchWord = "hh";

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            // Text(Body.searchWord),
            // SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            // SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(10)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(50)),
            AvailableProduct(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
