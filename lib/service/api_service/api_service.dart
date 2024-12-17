import 'dart:convert';

import 'package:e_commerce_ui/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  static const productApi = 'https://fakestoreapi.com/products';
  static const addProductApi = 'https://fakestoreapi.com/products';
  final specificCAtApi = 'https://fakestoreapi.com/products/category/jewelery';
  static const updateProductApi = 'https://fakestoreapi.com/products/7';
  static const deleteProductApi = 'https://fakestoreapi.com/products/6';

  Future<List<Product>> getProduct() async {
    final Response response = await http.get(Uri.parse(productApi));
    try {
      final List<dynamic> productList = jsonDecode(response.body);
      return productList.map((data) => Product.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Product> updateProduct(Product product) async {
    final Response response = await http.put(
      Uri.parse(updateProductApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> updateProduct = jsonDecode(response.body);
      return Product.fromJson(updateProduct);
    }
    throw Exception("problem fetching data");
  }

  Future<Product> addProduct(Product product) async {
    final Response response = await http.post(Uri.parse(addProductApi),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(product.toJson()));
    if (response.statusCode == 200) {
      final Map<String, dynamic> newProduct = jsonDecode(response.body);
      return Product.fromJson(newProduct);
    }
    throw Exception("problem fetching data");
  }
}
