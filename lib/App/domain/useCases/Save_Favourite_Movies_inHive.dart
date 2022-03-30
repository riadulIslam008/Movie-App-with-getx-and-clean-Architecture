import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class SaveMovieTableInHive extends UseCases<void, FavouriteMovieListModel> {
  final MovieRepository _repository;
  SaveMovieTableInHive(this._repository);

  @override
  Future<Either<AppError, void>> call(
      FavouriteMovieListModel movieEntity) async {
    return await _repository.saveMovieInHive(movieEntity: movieEntity);
  }
}
