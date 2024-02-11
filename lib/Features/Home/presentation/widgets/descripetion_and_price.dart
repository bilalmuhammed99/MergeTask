import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionAndPrice extends StatelessWidget {
  const DescriptionAndPrice({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle14.copyWith(
              fontSize: 12.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$$price",
            style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
