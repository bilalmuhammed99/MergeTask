import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Core/api/api_error_model.dart';
import 'package:flutter_application_1/Core/api/api_service.dart';
import 'package:flutter_application_1/Core/errors/failuers.dart';
import 'package:flutter_application_1/Features/Auth/data/models/login_request_body.dart';
import 'package:flutter_application_1/Features/Auth/data/models/user_model.dart';
import 'package:flutter_application_1/Features/Auth/data/repos/login_repository.dart';

class LoginRepositoryImplementations implements LoginRepository {
  final ApiService _apiService;

  LoginRepositoryImplementations(this._apiService);

  @override
  Future<Either<Failure, UserModel>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      var response = await _apiService.post(
          endPoint: "auth/login", data: loginRequestBody.toJson());

      return Right(UserModel.fromJson(response));
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromResponse(error.response!.statusCode,
            ApiResponse.fromJson(error.response?.data)));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
