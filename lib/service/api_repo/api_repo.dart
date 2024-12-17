import 'package:e_commerce_ui/service/api_service/api_service.dart';

import '../../product.dart';

class ApiRepository {
  Future<List<Product>> getProduct() {
    return ApiService().getProduct();
  }

  Future<Product> addProduct(Product product) {
    return ApiService().addProduct(product);
  }

  Future<Product> updateProduct(Product product) {
    return ApiService().updateProduct(product);
  }
}

class NetworkError extends Error {}
