import 'package:movie_app_tmdb/App/domain/entites/Movie_entity.dart';

// ignore: must_be_immutable
class MovieModel extends MovieEntity {
  MovieModel({
    required this.video,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.voteCount,
    this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.voteAverage,
    required this.popularity,
    required this.mediaType,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          id: id,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: originalTitle,
          voteAverage: voteAverage,
          language: originalLanguage.toString(),
          overview: overview,
        );

  bool video;
  int id;
  String overview;
  DateTime releaseDate;
  String title;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int voteCount;
  OriginalLanguage? originalLanguage;
  String originalTitle;
  String posterPath;
  double voteAverage;
  double popularity;
  MediaType? mediaType;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        video: json["video"],
        id: json["id"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]) ,
        title: json["title"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? "",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"] ?? "",
        voteAverage: json["vote_average"].toDouble(),
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
      );
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

enum OriginalLanguage { EN, NL, FR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "nl": OriginalLanguage.NL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
