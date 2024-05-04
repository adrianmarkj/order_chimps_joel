import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  // Future<List<StockModel>> getAllStocksFromApi();
}

class RemoteDataSourceImpl implements RemoteDatasource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  // @override
  // Future<List<StockModel>> getAllStocksFromApi() async {
  //   try {
  //     const String url = "https://www.cse.lk/api/todaySharePrice";
  //     final response = await client.post(Uri.parse(url), headers: {
  //       'content-type': 'application/json'
  //     }).timeout(const Duration(seconds: 10));
  //
  //     if (response.statusCode != 200) {
  //       debugPrint('${response.statusCode}: ${response.reasonPhrase}');
  //       return [];
  //     } else {
  //       final List<dynamic> responseBody = json.decode(response.body);
  //       final List<StockModel> stocks =
  //           responseBody.map((json) => StockModel.fromJson(json)).toList();
  //       return stocks;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return [];
  //   }
  // }
}
