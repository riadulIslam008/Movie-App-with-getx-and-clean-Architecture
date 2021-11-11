// To parse this JSON data, do
//
//     final videoDetails = videoDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app_tmdb/App/domain/entites/Video_Entity.dart';

VideoDetails videoDetailsFromJson(String str) =>
    VideoDetails.fromJson(json.decode(str));

class VideoDetails {
  VideoDetails({
    required this.id,
    required this.videos,
  });

  int id;
  List<VideoModel> videos;

  factory VideoDetails.fromJson(Map<String, dynamic> json) => VideoDetails(
        id: json["id"],
        videos: List<VideoModel>.from(
            json["results"].map((x) => VideoModel.fromJson(x))),
      );
}

class VideoModel extends VideoEntity {
  VideoModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  }) : super(
          key: key,
          title: name,
          type: type,
        );

  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );
}
