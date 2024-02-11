import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';

class DontHaveAnAccountAndSignUpButton extends StatelessWidget {
  const DontHaveAnAccountAndSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account ? ",
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Sign up",
              style: Styles.textStyle14.copyWith(
                  color: ColorManager.secondPrimary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.secondPrimary),
            ))
      ],
    );
  }
}
