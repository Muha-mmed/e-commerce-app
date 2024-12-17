part of 'store_bloc.dart';

@immutable
sealed class StoreEvent {}

class FetchProductEvent extends StoreEvent {}

class AddProduct extends StoreEvent {
   final Product product; 
  AddProduct({required this.product});
}
