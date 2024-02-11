import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/add_to_cart_button.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/favorite_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAction extends StatelessWidget {
  const ProductAction({
    super.key,
    required this.onAddToFavoritePress,
    required this.isFavorite,
    required this.onAddToCartPress,
    required this.isAddedToCart,
  });
  final VoidCallback onAddToFavoritePress;
  final bool isFavorite;
  final bool isAddedToCart;

  final VoidCallback onAddToCartPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          FavoriteButton(
              onAddToFavoritePress: onAddToFavoritePress,
              isFavorite: isFavorite),
          SizedBox(
            width: 8.w,
          ),
          AddToCartButton(
            onAddToCartPress: onAddToCartPress,
            isAddedToCart: isAddedToCart,
          )
        ],
      ),
    );
  }
}
