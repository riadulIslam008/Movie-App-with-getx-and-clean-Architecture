//* Movie_Entity
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';
import 'package:movie_app_tmdb/App/domain/entites/Cast_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Cast_Personal_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Details_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Search_Movies_Entitty.dart';
import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getUpcoming();
  Future<Either<AppError, List<MovieEntity>>> getNowPlaying();
  Future<Either<AppError, MovieDetailsEntity>> getMovieDetalis(
      {required int id});
  Future<Either<AppError, List<CastEntity>>> getCastDetalis({required int id});
  Future<Either<AppError, List<VideoEntity>>> getVideoDetails(
      {required int id});

  Future<Either<AppError, CastPersonalEntity>> getCastPersonalDetails(
      {required int id});
  Future<Either<AppError, List<SearchMoviesEntity>>> getSearchMovies(
      {required String searchParam});

  Future<Either<AppError, void>> saveMovieTable({required MovieEntity movieEntity});
  Future<Either<AppError, List<MovieEntity>>> getMovieTable();
  Future<Either<AppError, void>> saveMovieInHive({required FavouriteMovieListModel movieEntity});
  Future<Either<AppError, FavouriteMovieListModel>> getFavouriteMovieFromHive();
  Future<Either<AppError, void>> deleteMovieTable({required int id});
  Future<Either<AppError, void>> deleteMovieFromHive({required int id});
}
