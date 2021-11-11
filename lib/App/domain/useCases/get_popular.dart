import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/NoParams.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetPopular extends UseCases<List<MovieEntity>, NoParam>{
  final MovieRepository _repository;
  GetPopular(this._repository);

@override
  Future<Either<AppError, List<MovieEntity>>> call(NoParam noParam) async{
    return await _repository.getPopular();
  }
}
