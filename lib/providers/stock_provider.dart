import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';

class Stock with ChangeNotifier {
  List _stocks = [];

  List get stocks => _stocks;

  void addStock(Map<String, dynamic> stockDetails) async {
    Response response = await http.post(
        Uri.parse('http://127.0.0.1:8000/apis/add_stock/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(stockDetails));
    if (response.statusCode == 200) {
      Future.delayed(const Duration(microseconds: 0), () {
        //TODO: remove
        _stocks = jsonDecode(response.body);
      }).then((value) {
        notifyListeners();
      });
    }
  }

  void getStocks() async {
    Response response = await http.get(
      Uri.parse('http://127.0.0.1:8000/apis/get_stocks/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode == 200) {
      Future.delayed(const Duration(microseconds: 0), () {
        //TODO: remove
        _stocks = jsonDecode(response.body);
      }).then((value) {
        notifyListeners();
      });
    }
  }
}
