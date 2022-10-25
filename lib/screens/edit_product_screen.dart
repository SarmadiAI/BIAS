import 'dart:convert';
import 'dart:math';

import 'package:bias/components/bias_date_field.dart';
import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_subtitle.dart';
import 'package:bias/components/bias_text_field.dart';
import 'package:bias/components/bias_title.dart';
import 'package:bias/components/bias_text.dart';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../components/bias_dropdown_list.dart';
import '../components/bias_image_field.dart';
import '../providers/stock_provider.dart';
import 'home_screen.dart';

class EditProductScreen extends StatefulWidget {
  final int? itemId;
  const EditProductScreen({super.key, this.itemId});
  static const String id = "edit_product_screen";

  @override
  EditProductScreenState createState() => EditProductScreenState();
}

class EditProductScreenState extends State<EditProductScreen> {
  List data = [];

  @override
  void initState() {
    data = Provider.of<Stock>(context, listen: false).stocks;
    super.initState();
  }

  TextEditingController brandName = TextEditingController(text: null);
  TextEditingController description = TextEditingController(text: null);
  TextEditingController fullQuantity = TextEditingController(text: null);
  String? section;
  TextEditingController supplierPrice = TextEditingController(text: null);
  TextEditingController sellingPrice = TextEditingController(text: null);
  TextEditingController expirationDate = TextEditingController(text: null);
  TextEditingController reshippingDays = TextEditingController(text: null);
  String? image;

  bool editController = true;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (editController) {
      section = data[arguments['itemId']]['section'];
      expirationDate.text =
          '${data[arguments['itemId']]['expiration_date'] ?? ''}';
      image = data[arguments['itemId']]['image'];
      editController = false;
    }

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
                        const BIASHeading('Edit Product'),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showDataAlert(data[arguments['itemId']]['id'],
                                    arguments['itemId']);
                              },
                              child: const Icon(
                                CupertinoIcons.trash,
                                color: kBIASRedColor,
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
                      const SizedBox(height: 10),
                      const BIASTitle('Required Fields'),
                      BIASSubtitle(
                          'Essensial fields you need to input to get basic insights'),
                      const SizedBox(height: 20),
                      BIASTextField(
                        labelText: 'Product Title (Brand)',
                        controller: brandName,
                        innerText: data[arguments['itemId']]['brand_name'],
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Product Subtitle (Description)',
                        controller: description,
                        innerText: data[arguments['itemId']]['description'],
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Quantity',
                        isIntegerNumber: true,
                        controller: fullQuantity,
                        innerText:
                            '${data[arguments['itemId']]['available_quantity']}',
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
                      BIASSubtitle('Gain more deeper insights and predictions'),
                      const SizedBox(height: 20),
                      BIASTextField(
                        labelText: 'Supplier Price (Cost)',
                        isFloatNumber: true,
                        controller: supplierPrice,
                        innerText: data[arguments['itemId']]['supplier_price'],
                      ),
                      const SizedBox(height: 15),
                      BIASTextField(
                        labelText: 'Retail/Selling Price',
                        isFloatNumber: true,
                        controller: sellingPrice,
                        innerText: data[arguments['itemId']]['selling_price'],
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
                        innerText:
                            '${data[arguments['itemId']]['reshipping_days'] ?? ''}',
                      ),
                      const SizedBox(height: 15),
                      BIASImageField(
                        labelText: 'Image',
                        image: image,
                        getImage: (pickedImage) async {
                          pickedImage =
                              base64.encode(await pickedImage.readAsBytes());
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
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: InkWell(
                  onTap: () async {
                    if (brandName.text != '' &&
                        description.text != '' &&
                        section != null &&
                        fullQuantity.text != '') {
                      Provider.of<Stock>(context, listen: false).updateStock({
                        'id': data[arguments['itemId']]['id'],
                        'brand_name':
                            brandName.text == '' ? null : brandName.text,
                        'description':
                            description.text == '' ? null : description.text,
                        'section': section,
                        'available_quantity': fullQuantity.text == ''
                            ? null
                            : int.parse(fullQuantity.text),
                        'supplier_price': supplierPrice.text == ''
                            ? null
                            : supplierPrice.text,
                        'selling_price':
                            sellingPrice.text == '' ? null : sellingPrice.text,
                        'expiration_date': expirationDate.text == ''
                            ? null
                            : expirationDate.text,
                        'reshipping_days': reshippingDays.text == ''
                            ? null
                            : reshippingDays.text,
                        'image': image == null ? null : image,
                      }, true, arguments['itemId']);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                currentIndex: 0,
                              )));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kBIASBlueColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
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
            ),
          ],
        ),
      ),
    );
  }

  showDataAlert(id, fakeId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const BIASTitle(
            'Delete Product',
          ),
          content: SizedBox(
            height: 190,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BIASText(
                      "Are you sure you want to delete this product?",
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                            child: const Center(
                              child: BIASText(
                                'Go Back',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            Provider.of<Stock>(context, listen: false)
                                .deleteStock(id, fakeId);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      currentIndex: 0,
                                    )));
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
                    child: const BIASText('Note'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
