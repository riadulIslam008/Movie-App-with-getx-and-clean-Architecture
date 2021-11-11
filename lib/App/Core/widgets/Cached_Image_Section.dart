import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageSection extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final IconData errorIcon;
  final Color redColor;
  final double screenHeight;
  final Color black54;
  final Widget loadingSpiner;
  final double screenWidth;
  const CachedImageSection({
    Key? key,
    required this.imageUrl,
    required this.errorIcon,
    required this.redColor,
    required this.screenHeight,
    required this.black54,
    required this.loadingSpiner,
    this.borderRadius = 8.0,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: screenHeight,
        width: screenWidth,
        fit: BoxFit.cover,
        useOldImageOnUrlChange: true,
        placeholder: (context, _) => loadingSpiner,
        errorWidget: (context, _, dynamic error) {
          return Container(
            color: black54,
            child: Center(
              child: Icon(errorIcon, color: redColor),
            ),
          );
        },
      ),
    );
  }
}
