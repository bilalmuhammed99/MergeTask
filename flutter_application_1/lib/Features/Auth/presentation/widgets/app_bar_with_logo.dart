import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class AppBarWithLogo extends StatelessWidget {
  const AppBarWithLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6,
      width: double.infinity,
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SvgPicture.asset(
          AssetsData.logo,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
