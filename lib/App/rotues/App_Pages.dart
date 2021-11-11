import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/presentation/Cast_Profile_Section.dart/Cast_Profile_View.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeView.dart';
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Movie_Details.dart';
import 'package:movie_app_tmdb/App/presentation/WatchTrailerPage/watch_Trailer.dart';
import 'package:movie_app_tmdb/App/rotues/App_routes.dart';

class AppPages {
  static const INTIAL_ROUTE = Routes.Home;

  static final routes = [
    GetPage(name: Routes.Home, page:()=> HomeView()),
    GetPage(name: Routes.MOVIE_DEATILS, page:()=> MovieDetailsView()),
    GetPage(name: Routes.CAST_PROFILE, page:()=> CastProfileView()),
    GetPage(name: Routes.WATCH_TRAILER, page:()=> WatchTrailerView()),
  ];
}
