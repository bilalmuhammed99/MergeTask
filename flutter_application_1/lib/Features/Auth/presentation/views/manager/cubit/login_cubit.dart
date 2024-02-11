import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/CacheHelper/cache_helper.dart';
import 'package:flutter_application_1/Features/Auth/data/models/login_request_body.dart';
import 'package:flutter_application_1/Features/Auth/data/models/user_model.dart';
import 'package:flutter_application_1/Features/Auth/data/repos/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(LoginInitial());

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = true;

  void onShowPasswordChange() {
    isPassword = !isPassword;
    print(isPassword);
    emit(ShowAndHidePasswordState());
  }

  Future<void> emitLogin(LoginRequestBody loginRequestBody) async {
    emit(LoadingLoginState());
    var response = await _loginRepository.login(loginRequestBody);
    response.fold((failure) {
      emit(LoginErrorState(errMessage: failure.errMessage));
    }, (user) {
      CacheHelper().saveData("accessToken", user.token);
      emit(
        LoginSuccessfullyState(user: user),
      );
    });
  }
}
