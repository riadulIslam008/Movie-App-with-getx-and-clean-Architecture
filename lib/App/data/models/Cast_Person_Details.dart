// To parse this JSON data, do
//
//     final personDetails = personDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app_tmdb/App/domain/entites/Cast_Personal_Entity.dart';

CastPersonalDetails personDetailsFromJson(String str) =>
    CastPersonalDetails.fromJson(json.decode(str));

// ignore: must_be_immutable
class CastPersonalDetails extends CastPersonalEntity {
  CastPersonalDetails({
    required this.alsoKnownAs,
    required this.adult,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  }) : super(
          castName: name,
          dateOfBirth: birthday,
          placeOfBirth: placeOfBirth,
          biography: biography,
          profilePath: profilePath,
        );

  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final String birthday;
  final dynamic deathday;
  final int gender;
  final String homepage;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  factory CastPersonalDetails.fromJson(Map<String, dynamic> json) =>
      CastPersonalDetails(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"]?? "",
        birthday:json["birthday"] == null ? "" : DateTime.parse(json["birthday"]).toString(),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"] ?? "",
        id: json["id"],
        imdbId: json["imdb_id"] ?? "",
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"] ?? "",
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );
}
