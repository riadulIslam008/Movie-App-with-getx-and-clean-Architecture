import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Cached_Image_Section.dart';
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final double screenHeight;
  const MoviePoster({
    Key? key,
    required this.imageUrl,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            color: white54.withOpacity(0.4),
             borderRadius: BorderRadius.circular(8),
          ),
          child: CachedImageSection(
            imageUrl: imageUrl,
            errorIcon: Icons.error,
            redColor: redColor,
            black54: black54,
            screenHeight: screenHeight - 2,
            loadingSpiner: SizedBox.shrink(),
            screenWidth: 90,
            borderRadius: 8,
          ),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            color: white54.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CachedImageSection(
            imageUrl: imageUrl,
            errorIcon: Icons.error,
            redColor: redColor,
            black54: black54,
            screenHeight: screenHeight - 5,
            loadingSpiner: SizedBox.shrink(),
            screenWidth: 95,
            borderRadius: 8,
          ),
        ),
        Positioned(
          top:0,
          child: CachedImageSection(
            imageUrl: imageUrl,
            errorIcon: Icons.error,
            redColor: redColor,
            black54: black54,
            screenHeight: screenHeight - 10,
            loadingSpiner: LoadingSpiner(),
            screenWidth: 100,
            borderRadius: 8,
          ),
        ),
      ],
    );
  }
}
