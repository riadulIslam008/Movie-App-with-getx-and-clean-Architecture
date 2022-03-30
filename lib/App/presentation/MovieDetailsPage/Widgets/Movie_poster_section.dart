import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

class MoviePosterSection extends StatelessWidget {
  const MoviePosterSection({
    Key? key,
    required this.percent,
    required this.valuePack,
    required this.posterPath,
  }) : super(key: key);

  final percent;
  final valuePack;
  final String posterPath;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.20,
      left: screenWidth> 400? 400 / 24: screenWidth/24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(
            percent > uploadLimit
                ? (valuePack * angleForCard)
                : percent * angleForCard,
          ),
        child: Hero(
          tag: posterPath,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(posterPath),
                fit: BoxFit.cover,
              ),
            ),
            height: screenHeight * 0.20,
            width: screenWidth > 400 ? 400 * 0.25 : screenWidth * 0.25,
          ),
        ),
      ),
    );
  }
}
