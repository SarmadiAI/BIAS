import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'bias_text.dart';

class ProductInventoryCard extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final int? availableQuantity;
  final int? soldQuantity;
  final String? image;
  final void Function()? onTap;

  const ProductInventoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.availableQuantity,
    required this.soldQuantity,
    required this.image,
    required this.onTap,
  });

  @override
  State<ProductInventoryCard> createState() => _ProductInventoryCardState();
}

class _ProductInventoryCardState extends State<ProductInventoryCard> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: widget.onTap,
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
                            widget.title ?? 'Water Container Refilling',
                            fontSize: 14,
                          ),
                          BIASText(
                            widget.subtitle ?? '20L',
                            color: kBIASLightGrayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BIASText(
                            'Show Details',
                            color: kBIASBlueColor,
                            fontSize: 12,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 15),
                          BIASText(
                            'Qty. ${widget.availableQuantity}',
                            color: kBIASLightGrayColor,
                            fontSize: 13,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 15),
                          BIASText(
                            'Sold ${widget.soldQuantity}',
                            color: kBIASLightGrayColor,
                            fontSize: 13,
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
      ),
    );
  }
}
