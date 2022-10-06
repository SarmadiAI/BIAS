import 'package:bias/components/product_inventory_card.dart';
import 'package:bias/screens/charts_test.dart';
import 'package:bias/screens/product_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/bias_text.dart';
import '../../components/dashboard_container.dart';
import '../../components/product_shopping_card.dart';
import '../../components/bias_heading.dart';
import '../../components/bias_title.dart';
import '../../components/search_text_field.dart';
import '../../constants.dart';

class InventoryBody extends StatefulWidget {
  const InventoryBody({Key? key}) : super(key: key);

  @override
  _InventoryBodyState createState() => _InventoryBodyState();
}

class _InventoryBodyState extends State<InventoryBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    children: const [
                      BIASHeading('Inventory'),
                      Icon(
                        Icons.settings_outlined,
                        color: kBIASDarkGrayColor,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                SearchTextField(onChanged: (value) {}),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5),
                  child: Icon(
                    CupertinoIcons.arrow_up_arrow_down,
                    color: kBIASDarkGrayColor,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(children: [
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: BIASTitle('Water Container Refillings'),
              ),
              ProductInventoryCard(
                  onTap: () =>
                      Navigator.pushNamed(context, ProductInfoScreen.id)),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: BIASTitle('Water Bottles'),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: BIASTitle('Other'),
              ),
              SizedBox(height: 10),
            ]),
          ),
        ],
      ),
    );
  }
}
