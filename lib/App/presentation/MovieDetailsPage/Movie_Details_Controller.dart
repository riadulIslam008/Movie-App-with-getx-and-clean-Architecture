//Todo ======== Dartz Pacakge
import 'package:dartz/dartz.dart';

//* GetX
import 'package:get/get.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Error_Dialog.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';

//* MovieDetails Entity
import 'package:movie_app_tmdb/App/domain/entites/Movie_Details_Entity.dart';

//* Movie Param
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Cast_Entity.dart';

//* Movie Repositotry
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* Use Cases
import 'package:movie_app_tmdb/App/domain/useCases/get_CastDetails.dart';
import 'package:movie_app_tmdb/App/domain/useCases/get_MovieDetails.dart';
import 'package:movie_app_tmdb/App/domain/useCases/get_VideoDetails.dart';

//Todo ========= Home Controller ======
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

//Todo ======== App Routes and Bindings
import 'package:movie_app_tmdb/App/rotues/App_routes.dart';
import 'package:movie_app_tmdb/di/Binding.dart';

class MovieDetailsController extends GetxController {
  final MovieRepository _movieRepository;
  final int movieID;
  final int index;
  final bool checkFavouriteMovie;

  final HomeController _homeController = Get.find<HomeController>();

  MovieDetailsController(
      this._movieRepository, this.movieID, this.checkFavouriteMovie, this.index);
  MovieDetailsEntity? movieDetailsEntity;
  List<CastEntity>? castList;
  List<VideoEntity>? videoEntity;
  RxBool favouriteMovie = false.obs;

  @override
  void onInit() {
    favouriteMovie.value = checkFavouriteMovie;
    getMovieDetails(movieId: movieID);
    getCastDetails(movieId: movieID);
    videoDetails(movieId: movieID);
    super.onInit();
  }

  void getMovieDetails({required int movieId}) async {
    GetMovieDetalis getMovieDetails = GetMovieDetalis(_movieRepository);

    final Either<AppError, MovieDetailsEntity> movieDetails =
        await getMovieDetails(MovieParam(movieId));

    movieDetails.fold((l) {
      print(l);
    }, (r) {
      movieDetailsEntity = r;
      update();
    });
  }

  void getCastDetails({required int movieId}) async {
    GetCastDetails getCastDetails = GetCastDetails(_movieRepository);
    final Either<AppError, List<CastEntity>> castDetails =
        await getCastDetails(MovieParam(movieId));

    castDetails.fold((l) {
      print(l);
    }, (r) {
      castList = r;
      update();
    });
  }

  void videoDetails({required int movieId}) async {
    GetVideoDetails getVideoDetails = GetVideoDetails(_movieRepository);
    final Either<AppError, List<VideoEntity>> videoDetails =
        await getVideoDetails(MovieParam(movieId));

    videoDetails.fold((l) {
      errorDialog(
          error_message: l.errorMerrsage,
          retryFunction: () {
            Get.back();
            onInit();
          });
    }, (r) {
      videoEntity = r;
      update();
    });
  }

  // addInFavouriteMovie() {
  //   _homeController.saveInDatabase(
  //     movieEntity: MovieEntity(
  //       posterPath: movieDetailsEntity!.posterPath,
  //       id: movieDetailsEntity!.id,
  //       overview: movieDetailsEntity!.movieOverview,
  //       backdropPath: movieDetailsEntity!.backDropPath,
  //       title: movieDetailsEntity!.movieName,
  //       adult: false,
  //       voteAverage: 0.0,
  //       releaseDate: movieDetailsEntity!.releaseDate,
  //       language: "",
  //     ),
  //   );
  // }

  void saveFavouriteMovieInHiveDb() {
    _homeController.saveInHive(
      movieEntity: FavouriteMovieListModel(
          movieDetailsEntity!.posterPath,
          movieDetailsEntity!.id,
          movieDetailsEntity!.movieOverview,
          movieDetailsEntity!.backDropPath,
          movieDetailsEntity!.movieName,
          false,
          0.0,
          movieDetailsEntity!.releaseDate,
          ""),
    );
  }

  deleteFavoriteMovie() {
    _homeController.deleteMovieFromHive(movieID: index);
  }

  void trailerPage() {
    Binding().movieTrailerPage(videoEntity: videoEntity!);
    Get.toNamed(Routes.WATCH_TRAILER);
  }

  void personaDetailsPage({required int personID}) {
    Binding()
        .castDetailsPage(personID: personID, movieRepository: _movieRepository);
    Get.toNamed(Routes.CAST_PROFILE);
  }
}
