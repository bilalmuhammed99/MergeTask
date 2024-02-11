import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failuers.dart';
import 'package:flutter_application_1/Features/Auth/data/models/login_request_body.dart';
import 'package:flutter_application_1/Features/Auth/data/models/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> login(LoginRequestBody loginRequestBody);
}
