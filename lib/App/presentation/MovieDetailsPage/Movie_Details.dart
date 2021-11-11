import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//* Getx
import 'package:get/get.dart';

//*Network Image function
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';

//* Utils
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Button_Widget.dart';

//* Title text
import 'package:movie_app_tmdb/App/Core/widgets/Title_Text.dart';

//* controller
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Movie_Details_Controller.dart';
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/Cast_Details_View.dart';

//* Cover Photo section
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/Cover_Photo.dart';

//*Info Section
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Widgets/Movie_Info_Section.dart';

//* Loading section
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vulcan,
      body: Stack(
        children: [
          GetBuilder<MovieDetailsController>(
            builder: (controller) {
              if (controller.movieDetailsEntity == null) {
                return LoadingSpiner();
              } else {
                final movieInfos = controller.movieDetailsEntity!;
                return CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      //* Cover photo
                      delegate: CoverPhoto(
                        movieTitle: movieInfos.movieName,
                        movieGenres: movieInfos.movieGenres,
                        posterPath: baseImageUrl(path: movieInfos.posterPath),
                        backGroundImage:
                            baseImageUrl(path: movieInfos.backDropPath),
                        screenHeight: screenHeight,
                        uploadLimit: uploadLimit,
                      ),
                    ),

                    //* Body Section
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          //* Info section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MovieInfo(
                                icon: Icons.star_outline_sharp,
                                value: controller
                                    .movieDetailsEntity!.voteAverage
                                    .toString(),
                              ),
                              MovieInfo(
                                  icon: Icons.tv_outlined,
                                  value: "${movieInfos.companyName[0].name}m"),
                              MovieInfo(
                                  icon: Icons.slow_motion_video_rounded,
                                  value: "${movieInfos.runtime.toString()}m"),
                              MovieInfo(
                                  icon: Icons.av_timer_outlined,
                                  value:
                                      "${movieInfos.releaseDate.toString().substring(0, 11)}"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TitleText(title: CAST)),
                          SizedBox(height: 10),

                          //* Cast
                          controller.castList == null
                              ? LoadingSpiner()
                              : CastDetails(castList: controller.castList!),

                          //* Story Line
                          SizedBox(height: 10),

                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(title: STORY_LINE),
                                SizedBox(height: 7),
                                Text(
                                  movieInfos.movieOverview,
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),

                          //* ================= Bottom Button ===================//
                          controller.videoEntity == null
                              ? SizedBox.shrink()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: screenWidth,
                                  alignment: Alignment.bottomCenter,
                                  child: ButtonWidget(
                                    buttonText: WATCH_TRAILER,
                                    buttonWidth: screenWidth,
                                    onPressed: () {
                                      controller.trailerPage();
                                    },
                                    buttonStyle:
                                        Theme.of(context).textTheme.bodyText1!,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
         
        ],
      ),
    );
  }
}
