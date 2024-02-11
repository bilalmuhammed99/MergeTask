import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Core/utils/custom_text_form_field.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/manager/HomeCubit/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../Core/utils/constants.dart';

class SearchAppBarWithLogo extends StatelessWidget {
  const SearchAppBarWithLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsData.logoBlue, width: 40.w),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTextField(
              onChange: (value) {
                context.read<HomeCubit>().emitSearchProducts(search: value);
              },
              controller: context.read<HomeCubit>().searchController,
              isFilled: true,
              preffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  AssetsData.searchIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              label: "What are you Looking for ?",
              borderSide: BorderSide.none,
              fillColor: ColorManager.textFormColor,
            ),
          ),
        ),
      ],
    );
  }
}
