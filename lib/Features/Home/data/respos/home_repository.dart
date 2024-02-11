import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failuers.dart';
import 'package:flutter_application_1/Features/Home/data/models/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Product>>> fetchProducts();
  Future<Either<Failure, List<Product>>> searchProducts({required String search});

}
