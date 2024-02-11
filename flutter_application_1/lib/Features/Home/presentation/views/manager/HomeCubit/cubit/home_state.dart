part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class AddToFavoriteState extends HomeState {}

final class LoadingProducts extends HomeState {}

final class GetProductsSuccessfully extends HomeState {
  final List<Product> productsList;
  List<bool>? isAddedToFavList;
  List<bool>? isAddedToCartList;

  GetProductsSuccessfully({required this.productsList, this.isAddedToFavList , this.isAddedToCartList});
}

final class GetProductsError extends HomeState {
  final String errMessage;

  GetProductsError({required this.errMessage});
}
