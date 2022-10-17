import 'dart:convert';

import 'package:bias/providers/receipt_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'bias_text.dart';

class ProductShoppingCard extends StatefulWidget {
  final String id;
  final String title;
  final String? subtitle;
  final String? price;
  int initialQuantity;
  final String? image;

  ProductShoppingCard({
    super.key,
    required this.id,
    required this.title,
    required this.initialQuantity,
    this.subtitle,
    this.price,
    this.image,
  });

  @override
  State<ProductShoppingCard> createState() => _ProductShoppingCardState();
}

class _ProductShoppingCardState extends State<ProductShoppingCard> {
  String? _totalPrice;

  @override
  void initState() {
    widget.price == null
        ? _totalPrice = '--'
        : _totalPrice = (widget.initialQuantity * double.parse(widget.price!))
            .toStringAsFixed(2);
    super.initState();
  }

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
              offset: const Offset(0, 0), // changes position of shadow
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
                          fontSize: 14,
                        ),
                        BIASText(
                          widget.subtitle ?? '',
                          color: kBIASLightGrayColor,
                          fontSize: 12,
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
                            '${widget.price == '0.00' ? '--' : _totalPrice} JOD',
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 15),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.initialQuantity == 0
                                      ? null
                                      : widget.initialQuantity--;
                                  _totalPrice = (widget.initialQuantity *
                                          double.parse(widget.price!))
                                      .toStringAsFixed(2);
                                });
                                Provider.of<Receipt>(context, listen: false)
                                    .addItem(
                                  widget.id,
                                  widget.initialQuantity,
                                  widget.price,
                                  widget.title,
                                  widget.subtitle,
                                  widget.image,
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.minus,
                                color: kBIASBlueColor,
                                size: 15,
                              ),
                            ),
                            const SizedBox(width: 20),
                            BIASText(
                              '${widget.initialQuantity}',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.initialQuantity++;
                                  _totalPrice = (widget.initialQuantity *
                                          double.parse(widget.price!))
                                      .toStringAsFixed(2);
                                });

                                Provider.of<Receipt>(context, listen: false)
                                    .addItem(
                                  widget.id,
                                  widget.initialQuantity,
                                  widget.price,
                                  widget.title,
                                  widget.subtitle,
                                  widget.image,
                                );
                              },
                              child: const Icon(
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
                      image: widget.image != null
                          ? Image.memory(base64Decode(widget.image!)).image
                          : const AssetImage(
                              'assets/images/water_container.png'),
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
