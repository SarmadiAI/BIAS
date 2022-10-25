import 'package:flutter/material.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/stock_provider.dart';
import 'bias_text.dart';
import 'bias_title.dart';

class FilterDialog extends StatelessWidget {
  final Function func;
  const FilterDialog({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<Stock>(context, listen: true).stocks;
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
        'Filter by item',
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ParentChildCheckbox(
                parentCheckboxColor: kBIASBlueColor.withOpacity(0.9),
                childrenCheckboxColor: kBIASBlueColor.withOpacity(0.6),
                parent: const Text(
                  'Select All',
                  style: TextStyle(
                    color: kBIASDarkGrayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                children: [
                  for (int i = 0; i < data.length; i++)
                    Text(
                      data[i]['brand_name'],
                      style: const TextStyle(
                        color: kBIASDarkGrayColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  func([
                    ParentChildCheckbox.isParentSelected,
                    ParentChildCheckbox.selectedChildrens
                  ]);

                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: kBIASBlueColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: BIASText(
                      'Filter',
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
    );
  }
}
