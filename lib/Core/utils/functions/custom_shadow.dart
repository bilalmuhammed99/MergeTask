import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';

BoxShadow customShadow() {
  return BoxShadow(
    color: ColorManager.shadowColor.withOpacity(.1), // Shadow color
    spreadRadius: 5, // Spread of the shadow
    blurRadius: 7, // Blur of the shadow
    offset: const Offset(0, 3), // Offset of the shadow
  );
}
