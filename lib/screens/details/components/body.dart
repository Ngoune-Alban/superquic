import 'package:flutter/material.dart';
import 'package:superking/components/default_button.dart';
import 'package:superking/components/rounded_icon_btn.dart';
import 'package:superking/constants.dart';
import 'package:superking/models/Product.dart';
import 'package:superking/routes.dart';
import 'package:superking/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _itemCount = 0;
  void _augmente() {
    if (_itemCount < widget.product.quantity) {
      setState(() {
        _itemCount++;
      });
    }
  }

  void _diminue() {
    setState(() {
      if (_itemCount > 1) {
        _itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          // ...List.generate(
                          //   product.colors.length,
                          //   (index) => ColorDot(
                          //     color: product.colors[index],
                          //     isSelected: index == selectedColor,
                          //   ),
                          // ),
                          Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              _diminue();
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          Text(_itemCount.toString()),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          RoundedIconBtn(
                            icon: Icons.add,
                            showShadow: true,
                            press: () {
                              _augmente();
                            },
                          ),
                        ],
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Ajouter au bon de commande",
                          press: () {
                            cart.addToCart(
                                productId: widget.product.id,
                                unitPrice: widget.product.price,
                                productName: widget.product.title,
                                productDetailsObject: widget.product.images[0],
                                quantity: _itemCount);
                            print("on ajoute au bon de commande");
                            print(cart.getTotalAmount());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDots extends StatefulWidget {
  ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int _itemCount = 1;
  void _augmente() {
    setState(() {
      setState(() {
        _itemCount++;
      });
    });
  }

  void _diminue() {
    setState(() {
      setState(() {
        if (_itemCount > 1) {
          _itemCount--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          // ...List.generate(
          //   product.colors.length,
          //   (index) => ColorDot(
          //     color: product.colors[index],
          //     isSelected: index == selectedColor,
          //   ),
          // ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              _diminue();
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(_itemCount.toString()),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              _augmente();
            },
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
