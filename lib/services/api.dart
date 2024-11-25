import 'dart:convert';

import 'package:elbrit_central/models/price_info.dart';
import 'package:elbrit_central/models/product_info.dart';
import 'package:elbrit_central/models/employee_info.dart';
import 'package:elbrit_central/models/wall_info.dart';
import 'package:firebase_auth_platform_interface/src/user_info.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<EmployeeModel?> getEmployeeData({required String mobileNo}) async {
    var client = http.Client();
    var uri =
        Uri.parse('https://elbrit.devcorn.live/api/employee-info/$mobileNo');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["employee"].toString());
      return EmployeeModel.fromJson(json["employee"]);
    } else {
      return null;
    }
  }

  Future<List<WallModel>> getWallData() async {
    var client = http.Client();
    var uri = Uri.parse('https://elbrit.devcorn.live/api/walls');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return ((json["data"] ?? []) as List)
          .map<WallModel>((i) => WallModel.fromJson(i))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<PriceModel>> getPriceData() async {
    var client = http.Client();
    var uri = Uri.parse('https://elbrit.devcorn.live/api/prices');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return (json["data"] as List)
          .map<PriceModel>((i) => PriceModel.fromJson(i))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ProductModel> getProductData({required String id}) async {
    var client = http.Client();
    var uri = Uri.parse('https://elbrit.devcorn.live/api/products/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return ProductModel.fromJson(json["data"][0]);

      //  (json["data"] as List)
      //     .map<ProductModel>((i) => ProductModel.fromJson(i))
      //     .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://elbrit.devcorn.live/api/products');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return (json["data"] as List)
          .map<ProductModel>((i) => ProductModel.fromJson(i))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
