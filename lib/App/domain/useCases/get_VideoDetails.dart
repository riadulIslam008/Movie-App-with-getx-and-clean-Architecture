import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';
import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetVideoDetails extends UseCases<List<VideoEntity>, MovieParam> {
  final MovieRepository _repository;
  GetVideoDetails(this._repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParam movieParam) {
    return _repository.getVideoDetails(id: movieParam.id);
  }
}
