//* Cached Image Network
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/FavouriteIcon.dart';

//* Movie details List Page
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/Movie_Details_List.dart';

//* Movie Poster Section
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/Movie_poster_section.dart';

class CoverPhoto implements SliverPersistentHeaderDelegate {
  final double screenHeight;
  final double uploadLimit;
  final String backGroundImage;
  final String posterPath;
  final String movieTitle;
  final List movieGenres;

  CoverPhoto({
    required this.movieTitle,
    required this.movieGenres,
    required this.posterPath,
    required this.backGroundImage,
    required this.screenHeight,
    required this.uploadLimit,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / (screenHeight * 0.35);
    final valuePack = (1 - percent - 0.77).clamp(0, uploadLimit);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(backGroundImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            percent > uploadLimit
                ? SizedBox.shrink()
                : FavouriteIcon()
          ],
        ),
        if (percent > uploadLimit) ...[
          MoviePosterSection(
              percent: percent, valuePack: valuePack, posterPath: posterPath),
          MovieDetailsList(
              screenHeight: screenHeight,
              movieName: movieTitle,
              movieGenres: movieGenres),
        ] else ...[
          MovieDetailsList(
              screenHeight: screenHeight,
              movieName: movieTitle,
              movieGenres: movieGenres),
          MoviePosterSection(
              percent: percent, valuePack: valuePack, posterPath: posterPath),
        ],
      ],
    );
  }

  @override
  double get maxExtent => screenHeight * 0.40;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  TickerProvider? get vsync => null;
}
