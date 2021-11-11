import 'dart:convert';

import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';

class MovieTable extends MovieEntity {
  final int movieId;
  final String movieName;
  final String movieImageUrl;
  final String movieDescription;
  final String movieBackdropPath;
  MovieTable({
    required this.movieId,
    required this.movieName,
    required this.movieImageUrl,
    required this.movieDescription,
    required this.movieBackdropPath,
  }) : super(
          adult: false,
          backdropPath: movieBackdropPath,
          id: movieId,
          language: "",
          overview: movieDescription,
          posterPath: movieImageUrl,
          releaseDate: DateTime.now(),
          title: movieName,
          voteAverage: 0.0,
        );

  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'movieName': movieName,
      'movieImageUrl': movieImageUrl,
      'movieDescription': movieDescription,
      'movieBackdropPath': movieBackdropPath,
    };
  }

  factory MovieTable.fromMap(Map<String, dynamic> map) {
    return MovieTable(
      movieId: map['movieId'],
      movieName: map['movieName'],
      movieImageUrl: map['movieImageUrl'],
      movieDescription: map['movieDescription'],
      movieBackdropPath: map['movieBackdropPath'],
    );
  }

  factory MovieTable.fromMapMovieTableEntity(MovieEntity movieEntity) {
    return MovieTable(
      movieId: movieEntity.id,
      movieName: movieEntity.title,
      movieImageUrl: movieEntity.posterPath,
      movieDescription: movieEntity.overview,
      movieBackdropPath: movieEntity.backdropPath,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieTable.fromJson(String source) =>
      MovieTable.fromMap(json.decode(source));

  @override
  String toString() =>
      'MovieTable(movieId: $movieId, movieName: $movieName, movieImageUrl: $movieImageUrl, movieDescription: $movieDescription, movieBackdropPath: $movieBackdropPath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieTable &&
        other.movieId == movieId &&
        other.movieName == movieName &&
        other.movieBackdropPath == movieBackdropPath &&
        other.movieDescription == movieDescription &&
        other.movieImageUrl == movieImageUrl;
  }

  @override
  int get hashCode =>
      movieId.hashCode ^
      movieName.hashCode ^
      movieImageUrl.hashCode ^
      movieBackdropPath.hashCode ^
      movieDescription.hashCode;
}
