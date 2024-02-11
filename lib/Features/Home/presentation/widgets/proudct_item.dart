import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/descripetion_and_price.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/product_actions.dart';

class ProductItem extends StatelessWidget {
  final String price;
  final String title;
  final double? width;
  final ImageProvider? image;
  VoidCallback? onTap;
  final VoidCallback onAddToFavoritePress;
  final VoidCallback onAddToCartPress;
  final bool isFavorite;
  final bool isAddedToCart;
  ProductItem({
    super.key,
    required this.price,
    required this.title,
    this.width,
    this.image,
    this.onTap,
    required this.onAddToFavoritePress,
    required this.onAddToCartPress,
    required this.isFavorite,
    required this.isAddedToCart,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    double aspectRatio = orientation == Orientation.portrait ? 5 / 3 : 4 / 3;

    return GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          width: screenSize.width / 2,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Image(
                          image: image ?? const AssetImage(AssetsData.tp))),
                  Expanded(
                    flex: 1,
                    child: DescriptionAndPrice(
                      title: title,
                      price: price,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ProductAction(
                      isAddedToCart: isAddedToCart,
                      isFavorite: isFavorite,
                      onAddToCartPress: () {
                        onAddToCartPress.call();
                      },
                      onAddToFavoritePress: () {
                        onAddToFavoritePress.call();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
