//* Api Client
import 'package:movie_app_tmdb/App/data/dataSources/Core/ApiClient.dart';

//* Movie Model
import 'package:movie_app_tmdb/App/data/models/MovieModel.dart';
import 'package:movie_app_tmdb/App/data/models/MovieResult.dart';

import 'package:movie_app_tmdb/App/data/models/MovieDetails.dart';
import 'package:movie_app_tmdb/App/data/models/Search_Movie_Model.dart';
import 'package:movie_app_tmdb/App/data/models/Videos_Model.dart';

import 'package:movie_app_tmdb/App/data/models/Cast_Details.dart';
import 'package:movie_app_tmdb/App/data/models/Cast_Person_Details.dart';

abstract class MovieRemoteDataSources {
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getUpcoming();
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getNowPlaying();
  Future<MovieDetails> getMovieDetails({required int movieId});
  Future<List<Cast>> getCastDetails({required int movieId});
  Future<List<VideoModel>> getVideoDetails({required int movieId});
  Future<CastPersonalDetails> getCastPesonalDetails({required int personId});
  Future<List<SearchResult>> getSearchMovies({required String searchTrem});
}

class MovieRemoteDataSourcesImple implements MovieRemoteDataSources {
  final ApiClient _client;

  MovieRemoteDataSourcesImple(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    var response = await _client.get("trending/movie/week");
    final movies = MovieResult.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    var response = await _client.get("movie/popular");

    final movies = MovieResult.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await _client.get("movie/upcoming");

    final movies = MovieResult.fromJson(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _client.get("movie/now_playing");

    final movies = MovieResult.fromJson(response).results;
    return movies;
  }

  @override
  Future<MovieDetails> getMovieDetails({required int movieId}) async {
    final response = await _client.get("movie/$movieId");

    final movieDetails = MovieDetails.fromJson(response);

    return movieDetails;
  }

  @override
  Future<List<Cast>> getCastDetails({required int movieId}) async {
    final response = await _client.get("movie/$movieId/credits");
    final castDetails = CastDetails.fromJson(response).cast;

    return castDetails;
  }

  @override
  Future<List<VideoModel>> getVideoDetails({required int movieId}) async {
    final response = await _client.get("movie/$movieId/videos");
    final videos = VideoDetails.fromJson(response).videos;

    return videos;
  }

  @override
  Future<CastPersonalDetails> getCastPesonalDetails(
      {required int personId}) async {
    final response = await _client.get("person/$personId");
    final personDetails = CastPersonalDetails.fromJson(response);

    return personDetails;
  }

  @override
  Future<List<SearchResult>> getSearchMovies(
      {required String searchTrem}) async {
    var response =
        await _client.get("search/movie", param: {"query": searchTrem});

    final movies = SearchMovieDetails.fromJson(response).results;
    return movies;
  }
}
