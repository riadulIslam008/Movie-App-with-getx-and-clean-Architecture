import 'package:movie_app_tmdb/App/domain/entites/Movie_Details_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetMovieDetalis extends UseCases<MovieDetailsEntity, MovieParam> {
  final MovieRepository _repository;
  GetMovieDetalis(this._repository);

  @override
  Future<Either<AppError, MovieDetailsEntity>> call(MovieParam movieParam) {
    return _repository.getMovieDetalis(id: movieParam.id);
  }
}
