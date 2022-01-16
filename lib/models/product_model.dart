import 'package:flutter/material.dart';

class ProductModel {
  String productName;
  String productPrice;

  MaterialColor viewBackgroundColor;

  String productImageUrl;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.viewBackgroundColor,
    required this.productImageUrl,
  });
}
