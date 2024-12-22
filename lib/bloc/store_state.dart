part of 'store_bloc.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

final class StoreInitial extends StoreState {}

final class LoadingStore extends StoreState {}

final class StoreLoaded extends StoreState {
  final List<Product> productList;

  const StoreLoaded({required this.productList});
}

final class StoreError extends StoreState {
  final String message;

  const StoreError({required this.message});

  @override
  List<Object> get props => [message];
}
