import 'package:e_commerce_ui/service/api_service/api_service.dart';

import '../../product.dart';

class ApiRepository {
  Future<List<Product>> getProduct() {
    return ApiService().getProduct();
  }

}

class NetworkError extends Error {}
