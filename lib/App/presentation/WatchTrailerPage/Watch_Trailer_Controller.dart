import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
  void initialYoutubePlayer({required int selected}) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoEntity[selected].key,
      params: YoutubePlayerParams(
        autoPlay: true,
        captionLanguage: "en",
      ),
    );
     update();
  }

  @override
  void dispose() {
    youtubePlayerController!.close();
    super.dispose();
  }

  @override
  void onClose() {
    youtubePlayerController!.close();
    super.onClose();
  }

  void changeVideoitem({required int selectItem}) {
    youtubePlayerController!.load(videoEntity[selectItem].key);
    youtubePlayerController!.play();
    update();
  }
}
