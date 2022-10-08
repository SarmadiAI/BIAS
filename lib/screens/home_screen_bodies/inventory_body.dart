import 'package:bias/components/product_inventory_card.dart';
import 'package:bias/screens/product_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/bias_heading.dart';
import '../../components/bias_title.dart';
import '../../components/search_text_field.dart';
import '../../constants.dart';
import '../../providers/stock_provider.dart';

class InventoryBody extends StatefulWidget {
  const InventoryBody({Key? key}) : super(key: key);

  @override
  InventoryBodyState createState() => InventoryBodyState();
}

class InventoryBodyState extends State<InventoryBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    children: const [
                      BIASHeading('Inventory'),
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
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 5),
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
            child: ListView(children: stocksWidget(context)),
          ),
        ],
      ),
    );
  }
}

List<Widget> stocksWidget(BuildContext context) {
  List<Widget> waterRefill = [
    const SizedBox(height: 10),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Water Container Refillings'),
    )
  ];
  List<Widget> waterBottles = [
    const SizedBox(height: 10),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Water Bottles'),
    ),
  ];
  List<Widget> other = [
    const SizedBox(height: 10),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: BIASTitle('Other'),
    ),
  ];

  List data = Provider.of<Stock>(context, listen: true).stocks;
  for (int i = 0; i < data.length; i++) {
    if (data[i]['section'] == 'Water Container Refillings') {
      waterRefill.add(ProductInventoryCard(
          title: data[i]['brand_name'],
          subtitle: data[i]['description'],
          soldQuantity:
              data[i]['full_quantity'] - data[i]['available_quantity'],
          availableQuantity: data[i]['available_quantity'],
          image: data[i]['image'],
          onTap: () => Navigator.pushNamed(context, ProductInfoScreen.id,
              arguments: {'itemId': data[i]['id']})));
      waterRefill.add(const SizedBox(height: 10));
    } else if (data[i]['section'] == 'Water Bottles') {
      waterBottles.add(ProductInventoryCard(
          title: data[i]['brand_name'],
          subtitle: data[i]['description'],
          soldQuantity:
              data[i]['full_quantity'] - data[i]['available_quantity'],
          availableQuantity: data[i]['available_quantity'],
          image: data[i]['image'],
          onTap: () => Navigator.pushNamed(context, ProductInfoScreen.id,
              arguments: {'itemId': data[i]['id']})));
      waterBottles.add(const SizedBox(height: 10));
    } else {
      other.add(ProductInventoryCard(
          title: data[i]['brand_name'],
          subtitle: data[i]['description'],
          soldQuantity:
              data[i]['full_quantity'] - data[i]['available_quantity'],
          availableQuantity: data[i]['available_quantity'],
          image: data[i]['image'],
          onTap: () => Navigator.pushNamed(context, ProductInfoScreen.id,
              arguments: {'itemId': data[i]['id']})));
      other.add(const SizedBox(height: 10));
    }
  }
  return waterRefill + waterBottles + other;
}
