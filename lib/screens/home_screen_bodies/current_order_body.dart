import 'package:bias/components/bias_heading.dart';
import 'package:bias/components/bias_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/product_shopping_card.dart';
import '../../components/search_text_field.dart';
import '../../constants.dart';
import '../../providers/stock_provider.dart';

class CurrentOrderBody extends StatefulWidget {
  const CurrentOrderBody({Key? key}) : super(key: key);

  @override
  CurrentOrderBodyState createState() => CurrentOrderBodyState();
}

class CurrentOrderBodyState extends State<CurrentOrderBody> {
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
            child:
                ListView(cacheExtent: 5000000, children: stocksWidget(context)),
          ),
        ],
      ),
    );
  }
}

List<Widget> stocksWidget(BuildContext context) {
  List<Widget> waterRefill = [
    SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Water Container Refillings'),
    ),
  ];
  List<Widget> waterBottles = [
    SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Water Bottles'),
    ),
  ];
  List<Widget> other = [
    SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Other'),
    ),
  ];

  List data = Provider.of<Stock>(context, listen: true).stocks;
  for (int i = 0; i < data.length; i++) {
    if (data[i]['section'] == 'Water Container Refillings') {
      waterRefill.add(
        ProductShoppingCard(
          id: data[i]['id'].toString(),
          title: data[i]['brand_name'],
          subtitle: data[i]['description'],
          initialQuantity: 0,
          price: data[i]['price'] ?? 0,
          image: data[i]['image'],
        ),
      );
      waterRefill.add(const SizedBox(height: 10));
    } else if (data[i]['section'] == 'Water Bottles') {
      waterBottles.add(ProductShoppingCard(
        id: data[i]['id'].toString(),
        title: data[i]['brand_name'],
        subtitle: data[i]['description'],
        initialQuantity: 0,
        price: data[i]['price'] ?? 0,
        image: data[i]['image'],
      ));
      waterBottles.add(const SizedBox(height: 10));
    } else {
      other.add(ProductShoppingCard(
        id: data[i]['id'].toString(),
        title: data[i]['brand_name'],
        subtitle: data[i]['description'],
        initialQuantity: 0,
        price: data[i]['price'] ?? 0,
        image: data[i]['image'],
      ));
      other.add(const SizedBox(height: 10));
    }
  }

  return waterRefill + waterBottles + other;
}
