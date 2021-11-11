import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//* Getx and Home Controller
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Error_Image_Section.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

//* Base Image Url Path
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';

//* utils Color and screen Size
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

//* Cached Image Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/Movie_Poster.dart';

//* Loading Spiner

class MovieListSection extends GetWidget<HomeController> {
  const MovieListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double movieContainerHeight = screenHeight * 0.26;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => controller.movieslist.length != 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.movieslist.length,
                  primary: false,
                  itemBuilder: (context, index) {
                    //Todo ====== veriable Section ==========
                    var movieList = controller.movieslist[index];
                    int movieID = movieList.id;
                    String imageUrl = baseImageUrl(path: movieList.posterPath);

                    String title = movieList.title;
                    String lan =
                        movieList.language.replaceAll("OriginalLanguage.", "");
                    bool adult = movieList.adult;
                    String releaseDate =
                        movieList.releaseDate.toString().substring(0, 11);

                    String overView = movieList.overview;

                    double movieRating = movieList.voteAverage;
                    //Todo ====== veriable Section ==========//

                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: movieContainerHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Hero(
                              tag: imageUrl,
                              child: MoviePoster(
                                  imageUrl: imageUrl,
                                  screenHeight: movieContainerHeight),
                            ),
                            onTap: () {
                              controller.backGroundImageChange(index);
                            },
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.movieDetailscall(movieId: movieID);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  if (controller.showFavouriteList.value) ...[
                                    SizedBox.shrink(),
                                  ] else ...[
                                    SizedBox(height: 8),
                                    Text("$lan | R: $adult |  $releaseDate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!),
                                  ],
                                  SizedBox(height: 13),
                                  Text(
                                    overView,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style:
                                        Theme.of(context).textTheme.subtitle2!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          controller.showFavouriteList.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.deleteMovieFromDatabase(
                                        movieID: movieList.id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: Icon(
                                        CupertinoIcons.heart_circle_fill,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  movieRating.toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                )
                        ],
                      ),
                    );
                  },
                )
              : ErrorImageSection(),
        ),
      ),
    );
  }
}
