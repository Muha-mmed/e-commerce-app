import 'dart:async';
import 'dart:convert';

import 'package:e_commerce_ui/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  static const productApi = 'https://fakestoreapi.com/products';


  Future<List<Product>> getProduct() async {
    final Response response = await http.get(Uri.parse(productApi));
    try {
      final List<dynamic> productList = jsonDecode(response.body);
      return productList.map((data) => Product.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  
}
