import 'dart:convert';
import 'package:bias/components/bias_date_field.dart';
import 'package:bias/components/bias_dropdown_list.dart';
import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_image_field.dart';
import 'package:bias/components/bias_subtitle.dart';
import 'package:bias/components/bias_text_field.dart';
import 'package:bias/components/bias_title.dart';
import 'package:bias/components/bias_text.dart';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../providers/stock_provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String id = "add_product_screen";

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  TextEditingController brandName = TextEditingController(text: null);
  TextEditingController description = TextEditingController(text: null);
  TextEditingController fullQuantity = TextEditingController(text: null);
  String? section;
  TextEditingController supplierPrice = TextEditingController(text: null);
  TextEditingController sellingPrice = TextEditingController(text: null);
  TextEditingController expirationDate = TextEditingController(text: null);
  TextEditingController reshippingDays = TextEditingController(text: null);
  String? image;

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
                        const BIASHeading('Add Product'),
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
              ),
            ),
            Expanded(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const BIASTitle('Required Fields'),
                      const BIASSubtitle(
                          'Essensial fields you need to input to get basic insights'),
                      const SizedBox(height: 20),
                      BIASTextField(
                        labelText: 'Product Title (Brand)',
                        controller: brandName,
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Product Subtitle (Description)',
                        controller: description,
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Quantity',
                        isIntegerNumber: true,
                        controller: fullQuantity,
                      ),
                      const SizedBox(height: 15),
                      BIASDropdownList(
                        labelText: 'Section',
                        list: const [
                          'Water Container Refillings',
                          'Water Bottles',
                          'Other'
                        ],
                        controller: section,
                        onChange: (value) {
                          setState(() {
                            section = value;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      const BIASTitle('Optional Fields'),
                      const BIASSubtitle(
                          'Gain more deeper insights and predictions'),
                      const SizedBox(height: 20),
                      BIASTextField(
                        labelText: 'Supplier Price (Cost)',
                        isFloatNumber: true,
                        controller: supplierPrice,
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Retail/Selling Price',
                        isFloatNumber: true,
                        controller: sellingPrice,
                      ),
                      const SizedBox(height: 15),
                      BIASDateField(
                        labelText: 'Expiration Date',
                        controller: expirationDate,
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Re-shipping Days',
                        isIntegerNumber: true,
                        controller: reshippingDays,
                      ),
                      const SizedBox(height: 15),
                      BIASImageField(
                        labelText: 'Image',
                        image: image,
                        getImage: (pickedImage) async {
                          pickedImage =
                              base64.encode(await pickedImage!.readAsBytes());
                          setState(() {
                            image = pickedImage;
                          });
                        },
                        deleteImage: () {
                          setState(() {
                            image = null;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ]),
            ),
            InkWell(
              onTap: () {
                if (brandName.text != '' &&
                    description.text != '' &&
                    section != null &&
                    fullQuantity.text != '') {
                  Provider.of<Stock>(context, listen: false).addStock({
                    'brand_name': brandName.text,
                    'description': description.text,
                    'section': section,
                    'sold_quantity': 0,
                    'available_quantity': int.parse(fullQuantity.text),
                    'supplier_price':
                        supplierPrice.text == '' ? null : supplierPrice.text,
                    'selling_price':
                        sellingPrice.text == '' ? null : sellingPrice.text,
                    'expiration_date':
                        expirationDate.text == '' ? null : expirationDate.text,
                    'reshipping_days': reshippingDays.text,
                    'image': image == null ? null : image,
                  });
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
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
                    child: const Center(
                      child: BIASText(
                        'Add Product',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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
