import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/data/models/product_model.dart';
import 'package:flutter_application_1/Features/Home/data/respos/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(HomeInitial());

  List<Product> products = [];
  


  TextEditingController searchController = TextEditingController();
  Future<void> emitProducts() async {
    emit(LoadingProducts());
    var response = await _homeRepository.fetchProducts();

    response.fold((failure) {
      emit(GetProductsError(errMessage: failure.errMessage));
    }, (productsList) {
      products = productsList;

      emit(GetProductsSuccessfully(
        productsList: productsList,
        isAddedToFavList: List.filled(productsList.length, false),
        isAddedToCartList: List.filled(productsList.length, false)
        ,
        ));
    });
  }

  Future<void> emitSearchProducts({required String search}) async {
    emit(LoadingProducts());
    var response = await _homeRepository.searchProducts(search: search);

    response.fold((failure) {
      emit(GetProductsError(errMessage: failure.errMessage));
    }, (productsList) {
      products = productsList;
      emit(GetProductsSuccessfully(productsList: productsList));
    });
  }
}
