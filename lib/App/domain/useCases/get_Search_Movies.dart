import 'package:movie_app_tmdb/App/domain/entites/Movie_Search_Param.dart';
import 'package:movie_app_tmdb/App/domain/entites/Search_Movies_Entitty.dart';
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//* dartz
import 'package:dartz/dartz.dart';

//* AppError
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';
import 'package:movie_app_tmdb/App/domain/useCases/UseCases.dart';

class GetSearchMovies extends UseCases<List<SearchMoviesEntity>, MovieSearchParam> {
  final MovieRepository _repository;
  GetSearchMovies(this._repository);

  @override
  Future<Either<AppError, List<SearchMoviesEntity>>> call(
      MovieSearchParam searchParam) async {
    return await _repository.getSearchMovies(
        searchParam: searchParam.searchParams);
  }
}
