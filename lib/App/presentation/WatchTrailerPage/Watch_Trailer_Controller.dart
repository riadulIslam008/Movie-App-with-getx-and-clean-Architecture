import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerControlller extends GetxController {
  List<VideoEntity> videoEntity;
  WatchTrailerControlller({
    required this.videoEntity,
  });

  @override
  void onInit() {
    initialYoutubePlayer(selected: selectedIndex);
    super.onInit();
  }

  int selectedIndex = 0;
  YoutubePlayerController? youtubePlayerController;
  initialYoutubePlayer({required int selected}) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoEntity[selected].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "en",
      ),
    );
    update();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    youtubePlayerController!.dispose();
    super.onClose();
  }

  void changeVideoitem({required int selectItem}) {
    youtubePlayerController!.load(videoEntity[selectItem].key);
    youtubePlayerController!.play();
    update();
  }
}
