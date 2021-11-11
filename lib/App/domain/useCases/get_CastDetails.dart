import 'package:movie_app_tmdb/App/domain/entites/Cast_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetCastDetails extends UseCases<List<CastEntity>, MovieParam> {
  final MovieRepository _repository;
  GetCastDetails(this._repository);

  @override
  Future<Either<AppError,List<CastEntity>>> call(MovieParam movieParam) {
    return _repository.getCastDetalis(id: movieParam.id);
  }
}
