import 'dart:ui';
import 'package:bias/components/bias_date_field.dart';
import 'package:bias/components/bias_dropdown_list.dart';
import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_image_field.dart';
import 'package:bias/components/bias_subtitle.dart';
import 'package:bias/components/bias_text_field.dart';
import 'package:bias/components/bias_title.dart';
import 'package:bias/components/bias_text.dart';
import 'package:bias/constants.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bias_static_image_field.dart';
import '../components/bias_static_text_field.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);
  static const String id = "product_info_screen";

  @override
  _ProductInfoScreenState createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
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
                        BIASHeading(
                          'Product Info',
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EditProductScreen.id);
                              },
                              child: Icon(
                                CupertinoIcons.pen,
                                color: kBIASDarkGrayColor,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 15),
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
                      SizedBox(height: 20),
                      BIASStaticTextField(
                        labelText: 'Product Title (Brand)',
                        innerText: 'Water Container Refilling',
                      ), //TODO change filled text
                      SizedBox(height: 15),
                      BIASStaticTextField(
                          labelText: 'Product Subtitle (Description)'),
                      SizedBox(height: 15),
                      BIASStaticTextField(labelText: 'Quantity'),
                      SizedBox(height: 15),
                      BIASStaticTextField(labelText: 'Section'),
                      SizedBox(height: 20),
                      BIASStaticTextField(labelText: 'Supplier Price (Cost)'),
                      SizedBox(height: 15),
                      BIASStaticTextField(labelText: 'Retail/Selling Price'),
                      SizedBox(height: 15),
                      BIASStaticTextField(labelText: 'Expiration Date'),
                      SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Re-shipping Days',
                      ),
                      SizedBox(height: 15),
                      BIASStaticImageField(
                        labelText: 'Image',
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          showDataAlert();
                        },
                        child: BIASText(
                          'Delete Product',
                          color: kBIASRedColor,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  showDataAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          title: BIASTitle(
            'Delete Product',
          ),
          content: Container(
            height: 190,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BIASText(
                      "Are you sure you want to delete this product?",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: kBIASRedColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: BIASText(
                                'Go Back',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: kBIASLightGrayColor.withOpacity(0.9),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: BIASText(
                                'Delete',
                                color: kBIASLightGrayColor.withOpacity(0.9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: BIASText('Note'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BIASText(
                      'Deleting a product means that its trace will be gone forever from the database, this will cause data to be never retrieved back or analyzed. Be Careful.',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
