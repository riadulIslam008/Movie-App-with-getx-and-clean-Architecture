//* Equatable
import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String overview;
  final String backdropPath;
  final String title;
  final bool adult;
  final double voteAverage;
  final DateTime releaseDate;
  final String language;
  MovieEntity({
    required this.posterPath,
    required this.id,
    required this.overview,
    required this.backdropPath,
    required this.title,
    required this.adult,
    required this.voteAverage,
    required this.releaseDate,
    required this.language,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
