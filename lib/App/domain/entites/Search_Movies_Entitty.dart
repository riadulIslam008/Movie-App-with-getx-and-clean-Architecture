import 'package:equatable/equatable.dart';

class SearchMoviesEntity extends Equatable {
  final int id;
  final String posterPath, movieName, movieDescription;

  SearchMoviesEntity({
    required this.id,
    required this.posterPath,
    required this.movieName,
    required this.movieDescription,
  });

  @override
  List<Object?> get props => [id, movieName];
}
