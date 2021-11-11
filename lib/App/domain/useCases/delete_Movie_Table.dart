import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class DeleteMovieTable extends UseCases<void, MovieParam> {
  final MovieRepository _repository;
  DeleteMovieTable(this._repository);

  @override
  Future<Either<AppError, void>> call(MovieParam movieParam) async {
    return await _repository.deleteMovieTable(id: movieParam.id);
  }
}
