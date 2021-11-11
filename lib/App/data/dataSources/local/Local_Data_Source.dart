import 'package:movie_app_tmdb/App/data/dataSources/Core/SQL_Lite.dart';
import 'package:movie_app_tmdb/App/data/models/Movie_Table.dart';

abstract class LocalDataSource {
  Future<void> saveMovieTable({required MovieTable movieTable});
  Future<List<MovieTable>> fetchMovieTable();
  Future<void> deleteMovieTable({required int movieId});
}

class LocalDataSourceImpl extends LocalDataSource {
  final LocalDatabase _localDatabase;

  LocalDataSourceImpl(this._localDatabase);
  @override
  Future<void> deleteMovieTable({required int movieId}) async {
    final db = await _localDatabase.database;

   await db.delete(_localDatabase.table_Name, where: "movieId= ?", whereArgs: [movieId]);
  }

  @override
  Future<List<MovieTable>> fetchMovieTable() async {
    List<MovieTable> movieTable = [];
    final db = await _localDatabase.database;
    final movieList = await db.query(_localDatabase.table_Name);

    movieList.forEach((element) {
      movieTable.add(MovieTable.fromMap(element));
    });

    return movieTable;
  }

  @override
  Future<void> saveMovieTable({required MovieTable movieTable}) async {
    final db = await _localDatabase.database;
    await db.insert(
      _localDatabase.table_Name,
      movieTable.toMap(),
    );
  }
}
