import 'package:flutter/material.dart';

import '../../../../Core/utils/styles.dart';

class SigninYourAccounText extends StatelessWidget {
  const SigninYourAccounText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text(
        "Sign in your account",
        style: Styles.textStyle16.copyWith(color: const Color(0xff444444)),
      ),
    );
  }
}
