import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String movieName;
  final String backDropPath;
  final String posterPath;
  final String movieOverview;
  final List movieGenres;
  final double voteAverage;
  final DateTime releaseDate;
  final int runtime;
  final List companyName;

  MovieDetailsEntity({
    required this.id,
    required this.movieName,
    required this.backDropPath,
    required this.posterPath,
    required this.movieOverview,
    required this.movieGenres,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.companyName,
  });

  @override
  List<Object?> get props => [id, movieName, movieGenres.length];
}
