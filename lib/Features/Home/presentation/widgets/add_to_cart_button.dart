import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../Core/utils/assets.dart';
import '../../../../Core/utils/constants.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onAddToCartPress,
    this.isAddedToCart = false,
  });
  final VoidCallback onAddToCartPress;
  final bool isAddedToCart;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onPressed: onAddToCartPress,
        color:
            isAddedToCart ? ColorManager.primary : ColorManager.secondPrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                isAddedToCart ? AssetsData.checkIcon : AssetsData.cartIcon),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              child: Text(
                isAddedToCart ? "Added" : "Add To Cart",
                style: Styles.textStyle14
                    .copyWith(fontSize: 8.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
