import 'package:hive/hive.dart';

part 'hive_db.g.dart';

@HiveType(typeId: 0)
class FavouriteMovieListModel {
  @HiveField(0)
  final String posterPath;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final bool adult;
  @HiveField(6)
  final double voteAverage;
  @HiveField(7)
  final DateTime releaseDate;
  @HiveField(8)
  final String language;

  FavouriteMovieListModel(
      this.posterPath,
      this.id,
      this.overview,
      this.backdropPath,
      this.title,
      this.adult,
      this.voteAverage,
      this.releaseDate,
      this.language);
}
