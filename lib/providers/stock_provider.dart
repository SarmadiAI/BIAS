import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stock with ChangeNotifier {
  List _stocks = [];

  List get stocks => _stocks;

  void addStock(Map<String, dynamic> stockDetails) {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/apis/add_stock/'),
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
      Uri.parse(
          'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/apis/get_stocks/'),
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

  void updateStock(
      Map<String, dynamic> stockDetails, bool allDetails, int fakeId) {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/apis/update_stock/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode(stockDetails))
        .then((value) {
      if (value.statusCode == 200) {
        if (allDetails) {
          _stocks[fakeId] = stockDetails;
        } else {
          _stocks[fakeId]['available_quantity'] +=
              stockDetails['added_quantity'];
        }
        notifyListeners();
      }
    });
  }

  void deleteStock(int id, int fakeId) {
    http.get(
      Uri.parse(
          'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/apis/delete_stock/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).then((value) {
      _stocks.removeAt(fakeId);
      notifyListeners();
    });
  }
}
