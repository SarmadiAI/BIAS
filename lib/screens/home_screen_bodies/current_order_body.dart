import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_title.dart';
import 'package:bias/screens/charts_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/bias_text.dart';
import '../../components/dashboard_container.dart';
import '../../components/product_shopping_card.dart';
import '../../components/search_text_field.dart';
import '../../constants.dart';

class CurrentOrderBody extends StatefulWidget {
  const CurrentOrderBody({Key? key}) : super(key: key);

  @override
  _CurrentOrderBodyState createState() => _CurrentOrderBodyState();
}

class _CurrentOrderBodyState extends State<CurrentOrderBody> {
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
                      BIASHeading('Current Order'),
                      Visibility(
                        visible: false,
                        child: Icon(
                          Icons.settings_outlined,
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
              ProductShoppingCard(
                  title: 'Water Container Refilling',
                  subtitle: '20L',
                  price: 0.5),
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
