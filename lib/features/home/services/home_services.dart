import 'dart:convert';
import 'package:avais_store/features/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomeServices{
Future<Product> fetchDealOfDay({required BuildContext context}) async {
    double rating1 = 0.0;
    double rating2 = 0.0;
    List<Product> products = [];
    Product product = Product(
      product_title: '',
      product_description: '',
      product_stock_quantity: '',
      product_image_url: '',
      product_category: '',
      product_price: '',
      product_id: 0,
      product_rating: '0.0',
    );
    final response =
        await http.get(Uri.parse('http://192.168.0.43:3000/api/products'));

    if (response.statusCode == 200) {
      final List<dynamic> parsedProducts = json.decode(response.body);
      
        products = parsedProducts
            .map((jsonProduct) => Product.fromJson(jsonProduct))
            .toList();
        for (int i = 0; i < products.length; i++) {
          rating1=double.parse(product.product_rating);
          rating2= double.parse(products[i].product_rating);
          if(rating2>rating1){
            product = products[i];
          } else {
            //product = products[i+1];
          }
        }
        return product;
     
    } else {return product;}
  }

}