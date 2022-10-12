import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Receipt with ChangeNotifier {
  Map<String, dynamic> _receipt = {};

  Map get receipt => _receipt;

  void addItem(id, quantity, price, brandName, description) {
    quantity == 0
        ? _receipt.remove(id.toString())
        : _receipt[id.toString()] = [quantity, price, brandName, description];
    notifyListeners();
  }

  void createReceipt() {
    http.post(Uri.parse('http://127.0.0.1:8000/apis/create_receipt/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "sales": _receipt,
        }));
    _receipt = {};
    notifyListeners();
  }
}
