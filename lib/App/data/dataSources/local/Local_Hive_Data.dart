import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';

abstract class LocalHiveData {
  Future<FavouriteMovieListModel> getFavouriteMovies();
  Future<void> saveFavouriteMovies(
      FavouriteMovieListModel favouriteMovieListModel);
  Future<void> deleteFromHive(int index);
}

class LocalHiveDataImpl extends LocalHiveData {
 

  @override
  Future<FavouriteMovieListModel> getFavouriteMovies() async {
    final box = await Hive.box<FavouriteMovieListModel>(hiveDBname);
    print(box.get(hiveDBname));
    return await box.get(hiveDBname)!;
  }

  @override
  Future<void> saveFavouriteMovies(
      FavouriteMovieListModel favouriteMovieListModel) async {
    final box = await Hive.box<FavouriteMovieListModel>(hiveDBname);
    //  final Box box =await Hive.box(hiveDBname);
    await box.add(favouriteMovieListModel);
    print("saved");
  }

  @override
  Future<void> deleteFromHive(int index) async {
    final box = await Hive.box<FavouriteMovieListModel>(hiveDBname);
    await box.deleteAt(index);
  }
}
