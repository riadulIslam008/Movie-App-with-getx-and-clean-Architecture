import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class SaveMovieTable extends UseCases<void, MovieEntity>{
  final MovieRepository _repository;
  SaveMovieTable(this._repository);

@override
  Future<Either<AppError, void>> call(MovieEntity movieEntity) async{
    return await _repository.saveMovieTable(movieEntity: movieEntity);
  }
}
