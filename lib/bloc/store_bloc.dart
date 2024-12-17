import 'package:bloc/bloc.dart';
import 'package:e_commerce_ui/service/api_repo/api_repo.dart';
import 'package:meta/meta.dart';

import '../product.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final ApiRepository apiRepository = ApiRepository();
  StoreBloc() : super(StoreInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(LoadingStore());
      try {
        final List<Product> productList = await apiRepository.getProduct();
        emit(StoreLoaded(productList: productList));
      } on NetworkError {
        throw Exception("check your internet connection to load products");
      }
    });
    on<AddProduct>((event, emit) async {
      emit(LoadingStore());
      try {
        final newProduct = await apiRepository.addProduct(event.product);
        emit(AddNewProduct(newProduct: newProduct));
      } on NetworkError {
        throw Exception("check your internet connection to load products");
      }
    });
  }
}
