part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoadingLoginState extends LoginState {}
final class LoginSuccessfullyState extends LoginState {
  final UserModel user;

  LoginSuccessfullyState({required this.user});

}
final class LoginErrorState extends LoginState {
  final String errMessage ;

  LoginErrorState({required this.errMessage}); 


}

final class ShowAndHidePasswordState extends LoginState {}


