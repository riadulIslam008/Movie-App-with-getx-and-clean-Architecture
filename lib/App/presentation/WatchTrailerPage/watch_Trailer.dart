import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/presentation/WatchTrailerPage/Watch_Trailer_Controller.dart';
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerView extends StatelessWidget {
  const WatchTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vulcan,
      appBar: AppBar(
        title: Text(WATCH_TRAILER),
        centerTitle: true,
      ),
      body: GetBuilder<WatchTrailerControlller>(
        builder: (controller) {
          return controller.youtubePlayerController == null
              ? LoadingSpiner()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: controller.youtubePlayerController!,
                      progressIndicatorColor: Colors.teal,
                      progressColors: ProgressBarColors(
                        handleColor: Colors.teal,
                        backgroundColor: Colors.teal,
                        bufferedColor: vulcan,
                        playedColor: royalBlue,
                      ),
                    ),
                    builder: (BuildContext, player) {
                      final videoInfo = controller.videoEntity;
                      return Column(
                        children: [
                          player,
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (int i = 0;
                                      i < videoInfo.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        controller.selectedIndex = i;
                                        controller.changeVideoitem(
                                            selectItem: i);
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        margin: const EdgeInsets.only(top: 10),
                                        height: 150,
                                        color: controller.selectedIndex == i
                                            ? Colors.grey[700]
                                            : Colors.transparent,
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  YoutubePlayer.getThumbnail(
                                                videoId: videoInfo[i].key,
                                                quality: ThumbnailQuality.high,
                                              ),
                                              width: 200,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Text(
                                                  videoInfo[i].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
