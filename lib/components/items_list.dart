// import 'package:flutter/material.dart';
//
// import '../constants.dart';
// import 'bias_text.dart';
// import 'items.dart';
//
// class ItemsList extends StatefulWidget {
//   const ItemsList({Key? key}) : super(key: key);
//
//   @override
//   _ItemsListState createState() => _ItemsListState();
// }
//
// class _ItemsListState extends State<ItemsList> {
//   Items? _item = Items.all;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: const BIASText('All'),
//           leading: Radio<Items>(
//             activeColor: kBIASBlueColor.withOpacity(0.9),
//             value: Items.all,
//             groupValue: _item,
//             onChanged: (Items? value) {
//               setState(() {
//                 _item = value;
//               });
//             },
//           ),
//         ),
//         ListTile(
//           title: const BIASText('Item 1'),
//           leading: Radio<Items>(
//             activeColor: kBIASBlueColor.withOpacity(0.9),
//             value: Items.item1,
//             groupValue: _item,
//             onChanged: (Items? value) {
//               setState(() {
//                 _item = value;
//               });
//             },
//           ),
//         ),
//         ListTile(
//           title: const BIASText('Item 2'),
//           leading: Radio<Items>(
//             activeColor: kBIASBlueColor.withOpacity(0.9),
//             value: Items.item2,
//             groupValue: _item,
//             onChanged: (Items? value) {
//               setState(() {
//                 _item = value;
//               });
//             },
//           ),
//         ),
//         ListTile(
//           title: const BIASText('Item 3'),
//           leading: Radio<Items>(
//             activeColor: kBIASBlueColor.withOpacity(0.9),
//             value: Items.item3,
//             groupValue: _item,
//             onChanged: (Items? value) {
//               setState(() {
//                 _item = value;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
