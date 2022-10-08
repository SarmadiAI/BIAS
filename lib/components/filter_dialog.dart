import 'package:flutter/material.dart';

import '../constants.dart';
import 'bias_text.dart';
import 'bias_title.dart';
import 'items_list.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        top: 10.0,
      ),
      title: BIASTitle(
        'Filter by item',
      ),
      content: Container(
        height: 270,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // ParentChildCheckbox(
              //   parent: Text('Parent 1'),
              //   children: [
              //     Text('Children 1.1'),
              //     Text('Children 1.2'),
              //     Text('Children 1.3'),
              //     Text('Children 1.4'),
              //   ],
              //   parentCheckboxColor: kBIASBlueColor.withOpacity(0.9),
              //   childrenCheckboxColor: kBIASBlueColor.withOpacity(0.6),
              // ),
              ItemsList(),

              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // log(ParentChildCheckbox.isParentSelected.toString());
                    // log(ParentChildCheckbox.selectedChildrens.toString());
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kBIASBlueColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
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
      ),
    );
  }
}
