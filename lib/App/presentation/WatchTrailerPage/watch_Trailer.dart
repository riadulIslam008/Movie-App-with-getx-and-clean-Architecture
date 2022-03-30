import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/presentation/WatchTrailerPage/Watch_Trailer_Controller.dart';
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WatchTrailerView extends StatelessWidget {
  const WatchTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth > 400 ? 400 : screenWidth,
        child: Scaffold(
          backgroundColor: vulcan,
          appBar: AppBar(
            title: Text(WATCH_TRAILER),
            centerTitle: true,
          ),
          body: GetBuilder<WatchTrailerControlller>(
            builder: (controller) {
              final player = YoutubePlayerIFrame(
                aspectRatio: 16 / 9,
                controller: controller.youtubePlayerController!,
              );
              return controller.youtubePlayerController == null
                  ? LoadingSpiner()
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: YoutubePlayerControllerProvider(
                        // player: YoutubePlayer(
                        //   controller: controller.youtubePlayerController!,
                        //   progressIndicatorColor: Colors.teal,
                        //   progressColors: ProgressBarColors(
                        //     handleColor: Colors.teal,
                        //     backgroundColor: Colors.teal,
                        //     bufferedColor: vulcan,
                        //     playedColor: royalBlue,
                        //   ),
                        // ),
                        controller: controller.youtubePlayerController!,
                        child: YoutubeValueBuilder(
                          controller: controller.youtubePlayerController,
                          builder: (context, value) {
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              height: 150,
                                              color:
                                                  controller.selectedIndex == i
                                                      ? Colors.grey[700]
                                                      : Colors.transparent,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    width: 200,
                                                    child: Image.network(
                                                      YoutubePlayerController
                                                          .getThumbnail(
                                                        videoId:
                                                            videoInfo[i].key,
                                                         
                                                      ),
                                                      height: 150,
                                                      width: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
