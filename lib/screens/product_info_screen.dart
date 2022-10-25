import 'package:bias/components/bias_heading.dart';
import 'package:bias/constants.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bias_static_image_field.dart';
import '../components/bias_static_text_field.dart';
import '../components/bias_text.dart';
import '../components/bias_text_field.dart';
import '../providers/stock_provider.dart';
import 'home_screen.dart';

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
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    List data = Provider.of<Stock>(context, listen: true).stocks;
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
                                    context, EditProductScreen.id,
                                    arguments: {'itemId': arguments['itemId']});
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
                      const SizedBox(height: 10),
                      const SizedBox(height: 20),
                      BIASStaticTextField(
                        labelText: 'Product Title (Brand)',
                        innerText: data[arguments['itemId']]['brand_name'],
                      ),
                      const SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Product Subtitle (Description)',
                        innerText: data[arguments['itemId']]['description'],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: BIASStaticTextField(
                              labelText: 'Quantity',
                              innerText:
                                  '${data[arguments['itemId']]['available_quantity']}',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                TextEditingController controller =
                                    TextEditingController();
                                showModalBottomSheet<void>(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      height: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            BIASTextField(
                                              labelText: 'Added quantity',
                                              controller: controller,
                                              isIntegerNumber: true,
                                            ),
                                            const SizedBox(height: 10),
                                            InkWell(
                                              onTap: () {
                                                Provider.of<Stock>(context,
                                                        listen: false)
                                                    .updateStock({
                                                  'id':
                                                      data[arguments['itemId']]
                                                          ['id'],
                                                  'available_quantity': controller
                                                              .text ==
                                                          ''
                                                      ? 0
                                                      : data[arguments[
                                                                  'itemId']][
                                                              'available_quantity'] +
                                                          int.parse(
                                                              controller.text)
                                                }, false, arguments['itemId']);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen(
                                                              currentIndex: 0,
                                                            )));
                                              },
                                              child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  color: kBIASBlueColor
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: BIASText(
                                                    'Add',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBIASBlueColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17),
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
                      const SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Section',
                        innerText: data[arguments['itemId']]['section'],
                      ),
                      const SizedBox(height: 20),
                      BIASStaticTextField(
                        labelText: 'Supplier Price (Cost)',
                        innerText: data[arguments['itemId']]['supplier_price'],
                      ),
                      const SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Retail/Selling Price',
                        innerText: data[arguments['itemId']]['selling_price'],
                      ),
                      const SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Expiration Date',
                        innerText: data[arguments['itemId']]['expiration_date'],
                      ),
                      const SizedBox(height: 15),
                      BIASStaticTextField(
                        labelText: 'Re-shipping Days',
                        innerText:
                            '${data[arguments['itemId']]['reshipping_days'] ?? ''}',
                      ),
                      const SizedBox(height: 15),
                      BIASStaticImageField(
                          labelText: 'Image',
                          image: data[arguments['itemId']]['image']),
                      const SizedBox(height: 20),
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
