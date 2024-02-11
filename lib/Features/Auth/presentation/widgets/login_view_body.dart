import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';
import 'package:flutter_application_1/Core/utils/custom_button.dart';
import 'package:flutter_application_1/Core/utils/functions/custom_snack_bar.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/Auth/data/models/login_request_body.dart';
import 'package:flutter_application_1/Features/Auth/presentation/views/manager/cubit/login_cubit.dart';
import 'package:flutter_application_1/Features/Auth/presentation/widgets/app_bar_with_logo.dart';
import 'package:flutter_application_1/Features/Auth/presentation/widgets/dont_have_an_account_and_sign_up.dart';
import 'package:flutter_application_1/Features/Auth/presentation/widgets/email_and_password_form.dart';
import 'package:flutter_application_1/Features/Auth/presentation/widgets/sign_in_your_account_text.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/functions/custom_shadow.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWithLogo(),
          Padding(
            padding: EdgeInsets.only(top: 80.0.h),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  customShadow(),
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.sizeOf(context).width - 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SigninYourAccounText(),
                    const DontHaveAnAccountAndSignUpButton(),
                    SizedBox(
                      height: 28.h,
                    ),
                    const EmailAndPasswordForm(),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            "Forget your Password ?",
                            style: Styles.textStyle14.copyWith(
                              fontSize: 12.sp,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccessfullyState) {
                            print(state.user.token);
                            customSnackBar(context,
                                text: "Welcome ${state.user.firstName} ");

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                                (route) => false);
                          } else if (state is LoginErrorState) {
                            customSnackBar(context,
                                text: "Sorry ${state.errMessage} ",
                                color: ColorManager.customRed);
                          }
                        },
                        child: CustomButton(
                            verticalPadding: 10,
                            // buttonHeight: 45,
                            borderRadius: 5,
                            buttonText: "Sign in",
                            textStyle: Styles.textStyle14.copyWith(
                              color: Colors.white,
                            ),
                            onPressed: () {
                              login(context);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> login(BuildContext context) async {
  var cubit = context.read<LoginCubit>();
  cubit.emitLogin(LoginRequestBody(
      username: cubit.userNameController.text,
      password: cubit.passwordController.text));
}
