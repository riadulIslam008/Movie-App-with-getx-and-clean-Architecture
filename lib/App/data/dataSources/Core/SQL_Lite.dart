import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase localDatabase = LocalDatabase._init();
  LocalDatabase._init();

  static Database? _database;

  final String table_Name = "MovieDetails";
  final String id = "movieId";
  final String movie_title = "movieName";
  final String movie_image_url = "movieImageUrl";
  final String movie_overView = "movieDescription";
  final String movie_backdropPath = "movieBackdropPath";

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    final mobilePath = await getDatabasesPath();
    final String path = join(mobilePath, 'favouriteMovieTable.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE $table_Name($id INTEGER, $movie_title TEXT, $movie_image_url TEXT, $movie_overView TEXT, $movie_backdropPath TEXT);");
    });
    print("Database Created");
    return _database!;
  }

//
//* ─── INSER DATA IN LOCAL STORAGE ────────────────────────────────────────────────
//
  // Future createDb({required NotesModel notesModel}) async {
  //   final _db = await localDatabase.database;
  //   try {
  //     final _id = await _db.insert(
  //       table_Name,
  //       notesModel.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace,
  //     );
  //     print("Data Save");
  //     print(_id);
  //     return _id;
  //   } catch (e) {
  //     print("EXCEPTION: $e");
  //   }
  // }

//
//* ─── FETCH DATA FROM DATABASE ───────────────────────────────────────────────────
//
//   Future<List<NotesModel>> readData() async {
//     final _db = await localDatabase.database;
//     List<NotesModel> list = [];
//     final maps = await _db.query(TABLE_NAME);
//     for (var i = 0; i < maps.length; i++) {
//       list.add(NotesModel.fromMap(maps[i]));
//     }
//     print("Data Read successFully");
//     return list;
//   }

//   Future close() async {
//     _database!.close();
//   }

//   //
//   //* ─── DELETE DATA FROM DATABASE ──────────────────────────────────────────────────
//   //
//   Future<void> delete({required int id}) async {
//     try {
//       final _db = await localDatabase.database;
//       var _id = await _db.delete(TABLE_NAME, where: "id = ?", whereArgs: [id]);
//       print("delete succesfully $_id");
//     } catch (e) {
//       print("Delete exception : $e");
//     }
//   }

//   //
//   //* ─── UPDATE DATA ────────────────────────────────────────────────────────────────
//   //
//   Future<void> updateData(
//       {required int id,
//       required String title,
//       required String description}) async {
//     try {
//       final _db = await localDatabase.database;
//       var _id = await _db.update(TABLE_NAME,
//           {"$NOTES_TITLE": "$title", "$NOTES_DESCRIPTION": "$description"},
//           where: "id = ?", whereArgs: [id]);
//       print("Update succesfully $_id");
//     } catch (e) {
//       print("update Exception : $e");
//     }
//   }
}
