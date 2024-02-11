import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Features/Auth/presentation/views/manager/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/custom_text_form_field.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomTextField(
            controller: context.read<LoginCubit>().userNameController,
            label: "Email",
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              var cubit = context.read<LoginCubit>();
              return CustomTextField(
                controller: cubit.passwordController,
                isPassword: cubit.isPassword,
                label: "Password",
                suffix: InkWell(
                    onTap: () {
                      cubit.onShowPasswordChange();
                    },
                    child: cubit.isPassword
                        ? Image.asset(
                            AssetsData.eyeIcon,
                            width: 20,
                          )
                        : const Icon(Icons.remove_red_eye)),
              );
            },
          ),
        ),
      ],
    );
  }
}
