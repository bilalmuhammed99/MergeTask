import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Core/api/api_service.dart';
import 'package:flutter_application_1/Core/errors/failuers.dart';
import 'package:flutter_application_1/Features/Home/data/models/product_model.dart';
import 'package:flutter_application_1/Features/Home/data/respos/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final ApiService _apiService;

  HomeRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      var response = await _apiService.get(endPoint: "products");
      List<Product> productsList = [];

      for (var product in response["products"]) {
        productsList.add(Product.fromJson(product));
      }

      return Right(productsList);
    } catch (error) {
      if (error is DioException) {
        Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Product>>> searchProducts({required String search}) async{
     try {
      var response = await _apiService.get(endPoint: "products/search?q=$search");
      List<Product> productsList = [];

      for (var product in response["products"]) {
        productsList.add(Product.fromJson(product));
      }

      return Right(productsList);
    } catch (error) {
      if (error is DioException) {
        Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
}
}