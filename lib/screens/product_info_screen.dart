import 'package:bias/components/bias_heading.dart';
import 'package:bias/constants.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bias_static_image_field.dart';
import '../components/bias_static_text_field.dart';
import '../components/bias_text.dart';

class ProductInfoScreen extends StatefulWidget {
  final int? itemId;
  const ProductInfoScreen({super.key, this.itemId});
  static const String id = "product_info_screen";

  @override
  ProductInfoScreenState createState() => ProductInfoScreenState();
}

class ProductInfoScreenState extends State<ProductInfoScreen> {
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
              decoration: const BoxDecoration(
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
                        const BIASHeading(
                          'Product Info',
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EditProductScreen.id);
                              },
                              child: const Icon(
                                CupertinoIcons.pen,
                                color: kBIASDarkGrayColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
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
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child:
                                  BIASStaticTextField(labelText: 'Quantity')),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBIASBlueColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 17),
                                  child: Center(
                                    child: BIASText(
                                      'Add Quantity',
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
