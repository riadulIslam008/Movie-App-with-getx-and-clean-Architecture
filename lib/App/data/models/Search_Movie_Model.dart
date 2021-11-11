// To parse this JSON data, do
//
//     final searchMovieDetails = searchMovieDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app_tmdb/App/domain/entites/Search_Movies_Entitty.dart';

SearchMovieDetails searchMovieDetailsFromJson(String str) =>
    SearchMovieDetails.fromJson(json.decode(str));

class SearchMovieDetails {
  SearchMovieDetails({
    required this.results,
  });

  List<SearchResult> results;

  factory SearchMovieDetails.fromJson(Map<String, dynamic> json) =>
      SearchMovieDetails(
        results:
            List<SearchResult>.from(json["results"].map((x) => SearchResult.fromJson(x))),
      );
}

class SearchResult extends SearchMoviesEntity {
  SearchResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    //required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          id: id,
          movieDescription: overview,
          movieName: title,
          posterPath: posterPath,
        );

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  // OriginalLanguage? originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        adult: json["adult"],
        backdropPath:
            json["backdrop_path"] == null ? "" : json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // originalLanguage:
        //     originalLanguageValues.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? "" : json["poster_path"],
        releaseDate: json["release_date"]  ?? "",
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({"en": OriginalLanguage.EN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));

    return reverseMap;
  }
}
