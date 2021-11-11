// To parse this JSON data, do
//
//     final castDetails = castDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app_tmdb/App/domain/entites/Cast_Entity.dart';

CastDetails castDetailsFromJson(String str) =>
    CastDetails.fromJson(json.decode(str));

class CastDetails {
  CastDetails({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  factory CastDetails.fromJson(Map<String, dynamic> json) => CastDetails(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );
}

// ignore: must_be_immutable
class Cast extends CastEntity {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  }) : super(
          id: id,
          castOrginalName: originalName,
          characterName: character,
          profilePic: profilePath,
        );

  final bool adult;
  final int gender;
  final int id;
  KnownForDepartment? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment:
            knownForDepartmentValues.map[json["known_for_department"]],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
      );
}

enum KnownForDepartment { ACTING, DIRECTING, WRITING }

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Directing": KnownForDepartment.DIRECTING,
  "Writing": KnownForDepartment.WRITING
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
