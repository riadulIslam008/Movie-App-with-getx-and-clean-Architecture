//* Packages
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//* Network Image Function folder
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';

//* String
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';

//* Dialog Box
import 'package:movie_app_tmdb/App/Core/widgets/About_Dialog_Box.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Error_Dialog.dart';

//* Movie Entity
import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/NoParams.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Search_Param.dart';
import 'package:movie_app_tmdb/App/domain/entites/Search_Movies_Entitty.dart';

//* Movie Repository
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* Use Case
import 'package:movie_app_tmdb/App/domain/useCases/Save_MovieTable.dart';
import 'package:movie_app_tmdb/App/domain/useCases/delete_Movie_Table.dart';

//* Favourite Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_Favourite_Movie_Table.dart';

//* Search Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_Search_Movies.dart';

//* Treanding Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_Trending.dart';

//* NowPlaying Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_nowPlaying.dart';

//* Popular Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_popular.dart';

//* Upcoming Movie Api Call
import 'package:movie_app_tmdb/App/domain/useCases/get_upcoming.dart';
import 'package:movie_app_tmdb/App/rotues/App_routes.dart';

//* Binding
import 'package:movie_app_tmdb/di/Binding.dart';

class HomeController extends GetxController {
  HomeController(this._movieRepository);
  final MovieRepository _movieRepository;

  //* =============== UI Code ================

  late TextEditingController searchController;
  RxList<MovieEntity> movieslist = <MovieEntity>[].obs;
  RxBool loadingSpiner = true.obs;
  RxString backGroundImage = "".obs;
  RxBool showMovieMenuList = true.obs;
  RxList<SearchMoviesEntity> searchList = <SearchMoviesEntity>[].obs;
  RxBool showFavouriteList = false.obs;
  RxList<MovieEntity> favouriteMovieList = <MovieEntity>[].obs;
  RxBool searchDataNotFound = false.obs;

  @override
  void onInit() {
    searchController = TextEditingController();
    callApi(movieMenuItem: MOVIE_MENU[selectedIndex.value]);
    favouriteMovies();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  //* =========== Expansion Tile =========
  RxBool isExpanded = false.obs;

  void expandTile() {
    isExpanded.value = !isExpanded.value;
  }

  //Todo ================ Movie Menu Section ============
  RxString buttonName = MOVIE_MENU[0].obs;
  RxInt selectedIndex = 0.obs;

  void getdataFromApi({required int index}) {
    if (index == 5 || index == 6) {
      expandTile();
      callApi(movieMenuItem: MOVIE_MENU[index]);
    } else {
      selectedIndex.value = index;
      buttonName.value = MOVIE_MENU[selectedIndex.value];
      expandTile();
      loadingSpiner.value = true;
      callApi(movieMenuItem: MOVIE_MENU[selectedIndex.value]);
    }
  }
  //Todo ================  Movie Menu Section ============//

  void backGroundImageChange(int index) {
    backGroundImage.value = baseImageUrl(path: movieslist[index].backdropPath);
  }

//* ===================== Call Api =======================
  void callApi({required String movieMenuItem}) async {
    showFavouriteList.value = false;
    switch (movieMenuItem) {
      case "Popular":
        GetPopular getPopular = GetPopular(_movieRepository);
        final Either<AppError, List<MovieEntity>> eitherRepo =
            await getPopular(NoParam());

        getData(eitherRepo);
        break;
      case "Trending":
        GetTrending getTrending = GetTrending(_movieRepository);
        final Either<AppError, List<MovieEntity>> eitherRepo =
            await getTrending(NoParam());

        getData(eitherRepo);
        break;
      case "Upcoming":
        GetUpcoming getUpcoming = GetUpcoming(_movieRepository);
        final Either<AppError, List<MovieEntity>> eitherRepo =
            await getUpcoming(NoParam());

        getData(eitherRepo);
        break;

      case "Now Playing":
        GetNowplaying getNowPlaying = GetNowplaying(_movieRepository);

        final Either<AppError, List<MovieEntity>> eitherRepo =
            await getNowPlaying(NoParam());

        getData(eitherRepo);
        break;

      case "Favourite":
        showFavouriteList.value = true;
        movieslist.value = favouriteMovieList;
        loadingSpiner.value = false;
        break;

      case "About":
        aboutPage();
        break;

      default:
        print("Error Something");
        break;
    }
  }

  void getData(Either<AppError, List<MovieEntity>> eitherRepo) {
    eitherRepo.fold((l) {
      loadingSpiner.value = false;
      print(l);
      errorDialog(error_message: l.errorMerrsage, retryFunction: retryFunction);
    }, (r) {
      movieslist.value = r;
      backGroundImage.value = baseImageUrl(path: movieslist[0].backdropPath);
      loadingSpiner.value = false;
    });
  }

//* =============== Retry Button ==========
  void retryFunction() {
    Get.back();
    callApi(movieMenuItem: MOVIE_MENU[selectedIndex.value]);
  }
//* ===================== Call Api ======================= //

//* ===================== Get Search Moovies ============= //
  void getSearchMovieList({required String searchString}) async {
    searchDataNotFound.value = false;
    GetSearchMovies getSearchMovies = GetSearchMovies(_movieRepository);
    final Either<AppError, List<SearchMoviesEntity>> eitherRepo =
        await getSearchMovies(MovieSearchParam(searchParams: searchString));

    eitherRepo.fold((l) {
      searchDataNotFound.value = true;
    }, (r) {
      if(r.isEmpty) searchDataNotFound.value = true;
      searchList.value = r;

    });
  }

//* ===================== About Dialog Section =============//
  void aboutPage() {
    aboutDialogBox(description: ABOUT_DESCRIPTION);
  }

  //* ================= Movie Details section ========

  void movieDetailscall({required int movieId}) {
    bool checkFav = false;
    for (var i = 0; i < favouriteMovieList.length; i++) {
      if (favouriteMovieList[i].id == movieId) checkFav = true;
    }
    Binding().movieDetailsPage(
        movieRepository: _movieRepository,
        movieID: movieId,
        favouriteMovie: checkFav);
    Get.toNamed(Routes.MOVIE_DEATILS);
  }

  //* ============= Local Data Function =============
  void favouriteMovies() async {
    GetFavouriteMovie getFavouriteMovie = GetFavouriteMovie(_movieRepository);
    final Either<AppError, List<MovieEntity>> eitherRepo =
        await getFavouriteMovie(NoParam());

    eitherRepo.fold((l) {
      print(l.errorMerrsage);
    }, (r) {
      favouriteMovieList.value = r;
    });
  }

  void saveInDatabase({required MovieEntity movieEntity}) async {
    SaveMovieTable saveMovieTable = SaveMovieTable(_movieRepository);
    await saveMovieTable(movieEntity);
    favouriteMovies();
  }

  void deleteMovieFromDatabase({required int movieID}) async {
    DeleteMovieTable deleteMovie = DeleteMovieTable(_movieRepository);
    await deleteMovie(MovieParam(movieID));
    favouriteMovies();
  }
}
