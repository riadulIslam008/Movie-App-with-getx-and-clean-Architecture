 import 'package:movie_app_tmdb/App/data/api/ApiInfo/ApiConstants.dart';

 String baseImageUrl({required String path}) {
    return "${ApiConstants.BASE_IMAGE_URL}$path";
  }