import 'package:dartz/dartz.dart';
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';
import 'package:movie_app_tmdb/App/domain/entites/NoParams.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetFavouriteMovieFromHive
    extends UseCases<FavouriteMovieListModel, NoParam> {
  final MovieRepository _repository;
  GetFavouriteMovieFromHive(this._repository);

  @override
  Future<Either<AppError, FavouriteMovieListModel>> call(
      NoParam noParam) async {
    return await _repository.getFavouriteMovieFromHive();
  }
}
