import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'bias_text.dart';

class ProductShoppingCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final double? price;
  final ImageProvider<Object>? image;

  const ProductShoppingCard({
    required this.title,
    this.subtitle,
    this.price,
    this.image,
  });

  @override
  State<ProductShoppingCard> createState() => _ProductShoppingCardState();
}

class _ProductShoppingCardState extends State<ProductShoppingCard> {
  int _quantity = 0;
  String _totalPrice = 0.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3.5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BIASText(
                          widget.title,
                          fontSize: 13,
                        ),
                        BIASText(
                          widget.subtitle ?? '',
                          color: kBIASLightGrayColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: BIASText(
                            '$_totalPrice JOD',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 15),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _quantity > 0 ? _quantity-- : 0;
                                  _totalPrice = (_quantity * widget.price!)
                                      .toStringAsFixed(2);
                                });
                              },
                              child: Icon(
                                CupertinoIcons.minus,
                                color: kBIASBlueColor,
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 20),
                            BIASText(
                              '$_quantity',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _quantity++;
                                  _totalPrice = (_quantity * widget.price!)
                                      .toStringAsFixed(2);
                                });
                              },
                              child: Icon(
                                CupertinoIcons.plus,
                                color: kBIASBlueColor,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: CupertinoColors.extraLightBackgroundGray,
                    image: DecorationImage(
                      image: widget.image ??
                          AssetImage('assets/images/water_container.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
