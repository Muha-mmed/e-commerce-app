part of 'store_bloc.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class LoadingStore extends StoreState {}

final class StoreLoaded extends StoreState {
  final List<Product> productList;

  StoreLoaded({required this.productList});
}

final class AddNewProduct extends StoreState {
  final Product newProduct;

  AddNewProduct({required this.newProduct});
}

final class StoreError extends StoreState {
  final String message;

  StoreError({required this.message});
}
