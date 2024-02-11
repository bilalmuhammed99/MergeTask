import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../Core/utils/constants.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.onAddToFavoritePress,
    this.isFavorite = false,
    super.key,
  });
  final VoidCallback onAddToFavoritePress;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAddToFavoritePress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(BorderSide(
                color: isFavorite
                    ? ColorManager.customRed
                    : ColorManager.secondPrimary))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            isFavorite ? AssetsData.heart : AssetsData.favIcon,
            color: isFavorite
                ? ColorManager.customRed
                : ColorManager.secondPrimary,
          ),
        ),
      ),
    );
  }
}
