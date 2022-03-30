import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class DeleteMovieTableFromHive extends UseCases<void, int> {
  final MovieRepository _repository;
  DeleteMovieTableFromHive(this._repository);

  @override
  Future<Either<AppError, void>> call(int id) async {
    return await _repository.deleteMovieTable(id: id);
  }
}
