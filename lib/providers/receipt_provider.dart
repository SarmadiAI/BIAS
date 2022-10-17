import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Receipt with ChangeNotifier {
  Map<String, dynamic> _receipt = {};

  Map get receipt => _receipt;

  void addItem(id, quantity, price, brandName, description, image) {
    quantity == 0
        ? _receipt.remove(id.toString())
        : _receipt[id.toString()] = [
            quantity,
            price,
            brandName,
            description,
            image,
          ];
    notifyListeners();
  }

  Future<bool> createReceipt() async {
    await http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/apis/create_receipt/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode(<String, dynamic>{
              "sales": _receipt,
            }))
        .then((value) {
      _receipt = {};
      notifyListeners();
    });
    return true;
  }
}
