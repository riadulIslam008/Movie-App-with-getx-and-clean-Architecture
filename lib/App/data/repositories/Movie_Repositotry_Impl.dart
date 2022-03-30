//* dartz
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/Core/errors/Custome_Error.dart';

//* Const String
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/data/dataSources/local/Local_Data_Source.dart';
import 'package:movie_app_tmdb/App/data/dataSources/local/Local_Hive_Data.dart';

//* Remote data Sources
import 'package:movie_app_tmdb/App/data/dataSources/remote/remote_data_sources.dart';

//*Model
import 'package:movie_app_tmdb/App/data/models/Cast_Details.dart';
import 'package:movie_app_tmdb/App/data/models/Cast_Person_Details.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';
import 'package:movie_app_tmdb/App/data/models/MovieDetails.dart';
import 'package:movie_app_tmdb/App/data/models/MovieModel.dart';
import 'package:movie_app_tmdb/App/data/models/Movie_Table.dart';
import 'package:movie_app_tmdb/App/data/models/Search_Movie_Model.dart';
import 'package:movie_app_tmdb/App/data/models/Videos_Model.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';

//* demoain Repository
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSources _remoteDataSources;
  final LocalDataSource _localDataSource;
  final LocalHiveData _localHiveData;
  MovieRepositoryImpl(
      this._remoteDataSources, this._localDataSource, this._localHiveData);

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await _remoteDataSources.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      List<MovieModel> movies = await _remoteDataSources.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getUpcoming() async {
    try {
      final movies = await _remoteDataSources.getUpcoming();
      return Right(movies);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getNowPlaying() async {
    try {
      final movies = await _remoteDataSources.getNowPlaying();
      return Right(movies);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, MovieDetails>> getMovieDetalis(
      {required int id}) async {
    try {
      final movieDetails =
          await _remoteDataSources.getMovieDetails(movieId: id);
      return Right(movieDetails);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<Cast>>> getCastDetalis({required int id}) async {
    try {
      final cast = await _remoteDataSources.getCastDetails(movieId: id);
      return Right(cast);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<VideoModel>>> getVideoDetails(
      {required int id}) async {
    try {
      final videos = await _remoteDataSources.getVideoDetails(movieId: id);
      return Right(videos);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, CastPersonalDetails>> getCastPersonalDetails(
      {required int id}) async {
    try {
      final personalInfo =
          await _remoteDataSources.getCastPesonalDetails(personId: id);
      return Right(personalInfo);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, List<SearchResult>>> getSearchMovies(
      {required String searchParam}) async {
    try {
      final movies =
          await _remoteDataSources.getSearchMovies(searchTrem: searchParam);

      return Right(movies);
    } on SocketException {
      return Left(AppError(INTERNET_CONNECTION_ERROR));
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  @override
  Future<Either<AppError, void>> deleteMovieTable({required int id}) async {
    try {
      final response = await _localDataSource.deleteMovieTable(movieId: id);
      return Right(response);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getMovieTable() async {
    try {
      final response = await _localDataSource.fetchMovieTable();
      return Right(response);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovieTable(
      {required MovieEntity movieEntity}) async {
    try {
      final response = await _localDataSource.saveMovieTable(
          movieTable: MovieTable.fromMapMovieTableEntity(movieEntity));
      return Right(response);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  httpErrorCase(e) {
    switch (e.statusCode) {
      case 400:
        return Left(AppError(e.message.toString()));
      case 401:
        return Left(AppError(e.message.toString()));
      case 404:
        return Left(AppError("The resource you requested could not be found."));
    }
    return Left(AppError(UNKNOWN_ERROR));
  }

  @override
  Future<Either<AppError, void>> saveMovieInHive(
      {required FavouriteMovieListModel movieEntity}) async {
    try {
      final response = await _localHiveData.saveFavouriteMovies(movieEntity);
      return Right(response);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, FavouriteMovieListModel>>
      getFavouriteMovieFromHive() async {
    try {
      final reponse = await _localHiveData.getFavouriteMovies();
      return Right(reponse);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> deleteMovieFromHive({required int id}) async {
    try {
      final response = await _localHiveData.deleteFromHive(id);
      return Right(response);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
