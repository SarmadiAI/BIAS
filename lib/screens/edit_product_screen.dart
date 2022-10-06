import 'dart:ui';
import 'package:bias/components/bias_date_field.dart';
import 'package:bias/components/bias_dropdown_list.dart';
import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_image_field.dart';
import 'package:bias/components/bias_subtitle.dart';
import 'package:bias/components/bias_text_field.dart';
import 'package:bias/components/bias_title.dart';
import 'package:bias/screens/home_screen_bodies/current_order_body.dart';
import 'package:bias/screens/home_screen_bodies/insights_body.dart';
import 'package:bias/screens/home_screen_bodies/inventory_body.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:bias/components/bias_text.dart';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const String id = "edit_product_screen";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BIASHeading('Edit Product'),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: kBIASDarkGrayColor,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      BIASTitle('Required Fields'),
                      BIASSubtitle(
                          'Essensial fields you need to input to get basic insights'),
                      SizedBox(height: 20),
                      BIASTextField(
                        labelText: 'Product Title (Brand)',
                        innerText: 'Water Bottle',
                      ),
                      SizedBox(height: 15),
                      BIASTextField(
                          labelText: 'Product Subtitle (Description)'),
                      SizedBox(height: 15),
                      BIASTextField(
                          labelText: 'Quantity', isIntegerNumber: true),
                      SizedBox(height: 15),
                      BIASDropdownList(
                        labelText: 'Section',
                        list: [
                          'Water Container Refillings',
                          'Water Bottles',
                          'Other'
                        ],
                      ),
                      SizedBox(height: 30),
                      BIASTitle('Optional Fields'),
                      BIASSubtitle('Gain more deeper insights and predictions'),
                      SizedBox(height: 20),
                      BIASTextField(
                          labelText: 'Supplier Price (Cost)',
                          isFloatNumber: true),
                      SizedBox(height: 15),
                      BIASTextField(
                          labelText: 'Retail/Selling Price',
                          isFloatNumber: true),
                      SizedBox(height: 15),
                      BIASDateField(labelText: 'Expiration Date'),
                      SizedBox(height: 15),
                      BIASTextField(
                          labelText: 'Re-shipping Days', isIntegerNumber: true),
                      SizedBox(height: 15),
                      BIASImageField(labelText: 'Image'),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: kBIASBlueColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: BIASText(
                      'Edit Product',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
