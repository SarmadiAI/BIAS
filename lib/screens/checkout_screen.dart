import 'package:bias/components/bias_subtitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bias_heading.dart';
import '../components/bias_text.dart';
import '../components/bias_title.dart';
import '../components/product_shopping_card.dart';
import '../constants.dart';
import '../providers/receipt_provider.dart';
import '../providers/stock_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String id = "checkout_screen";

  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {
  String subTotal() {
    double subTotal = 0;
    Map order = Provider.of<Receipt>(context, listen: true).receipt;
    for (var item in order.values) {
      subTotal += item[0] * double.parse(item[1]);
    }
    return subTotal.toStringAsFixed(2);
  }

  String total() {
    return subTotal();
  }

  @override
  Widget build(BuildContext context) {
    Map receipt = Provider.of<Receipt>(context, listen: true).receipt;

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
                        const BIASHeading('Checkout'),
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: BIASTitle('Current Order'),
                ),
                for (var item in receipt.keys)
                  Column(
                    children: [
                      ProductShoppingCard(
                        id: item,
                        title: receipt[item][2],
                        subtitle: receipt[item][3],
                        initialQuantity: receipt[item][0],
                        price: receipt[item][1],
                        showTotalPrice: true,
                        image: receipt[item][4],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: BIASTitle('Payment Summary'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BIASSubtitle('Basket Total'),
                          BIASSubtitle('${subTotal()} JOD'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BIASSubtitle('Basket Tax Total'),
                          const BIASSubtitle('0.0 JOD'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BIASText('Basket Total'),
                          BIASText('${total()} JOD'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
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
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: kBIASBlueColor.withOpacity(0.9),
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: BIASText(
                              'Add Items',
                              color: kBIASBlueColor.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (receipt.isNotEmpty) {
                            Provider.of<Receipt>(context, listen: false)
                                .createReceipt()
                                .then((value) {
                              Provider.of<Stock>(context, listen: false)
                                  .getStocks();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kBIASBlueColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: BIASText(
                              'Checkout',
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
            ),
          ],
        ),
      ),
    );
  }
}
