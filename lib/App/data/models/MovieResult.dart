// To parse this JSON data, do
//
//     final movieResult = movieResultFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app_tmdb/App/data/models/MovieModel.dart';

MovieResult movieResultFromJson(String str) => MovieResult.fromJson(json.decode(str));


class MovieResult {
    MovieResult({
       required this.results,
    });


   final List<MovieModel> results;
 
    factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
   
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
      
    );

  
}

