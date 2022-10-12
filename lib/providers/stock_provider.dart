import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stock with ChangeNotifier {
  List _stocks = [];

  List get stocks => _stocks;

  void addStock(Map<String, dynamic> stockDetails) {
    http
        .post(Uri.parse('http://127.0.0.1:8000/apis/add_stock/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode(stockDetails))
        .then((value) {
      if (value.statusCode == 200) {
        _stocks.add(stockDetails);
        notifyListeners();
      }
    });
  }

  void getStocks() {
    http.get(
      Uri.parse('http://127.0.0.1:8000/apis/get_stocks/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).then((value) {
      if (value.statusCode == 200) {
        _stocks = jsonDecode(value.body);
        notifyListeners();
      }
    });
  }
}
