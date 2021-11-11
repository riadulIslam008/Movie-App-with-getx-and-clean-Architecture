import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_tmdb/App/domain/entites/Cast_Personal_Entity.dart';
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetCastPersonalDetails extends UseCases<CastPersonalEntity, MovieParam> {
  final MovieRepository _movieRepository;

  GetCastPersonalDetails(this._movieRepository);
  @override
  Future<Either<AppError, CastPersonalEntity>> call(MovieParam params) {
    return _movieRepository.getCastPersonalDetails(id: params.id);
  }
}
