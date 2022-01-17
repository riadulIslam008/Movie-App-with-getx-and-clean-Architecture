import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//* Getx and Controller
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Assets_Image.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';

class ShowSearchMovieList extends GetWidget<HomeController> {
  final double screenWidth;


  const ShowSearchMovieList({
    Key? key,
    required this.screenWidth,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.70,
      color: vulcan,
      child: Obx(
        () => controller.searchList.length == 0
            ? Center(
                child: controller.searchDataNotFound.value
                    ? FileNotFound()
                    : LoadingSpiner(),
              )
            : ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: controller.searchList.length,
                itemBuilder: (context, index) {
                  if (controller.searchList.isEmpty) {
                    return LoadingSpiner();
                  } else {
                    final movieList = controller.searchList;
                    final posterPath =
                        baseImageUrl(path: movieList[index].posterPath);
                    return movieList[index].posterPath.isEmpty
                        ? SizedBox.shrink()
                        : Container(
                            margin: const EdgeInsets.only(
                                top: 4, bottom: 6, left: 5),
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          posterPath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.movieDetailscall(
                                          movieId: movieList[index].id);
                                    },
                                    child: SizedBox(
                                      width: screenWidth * 0.80 - 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movieList[index].movieName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            movieList[index].movieDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  }
                },
              ),
      ),
    );
  }
}
