import "package:get/get.dart";
import 'package:hive/hive.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/data/dataSources/Core/SQL_Lite.dart';
import 'package:movie_app_tmdb/App/data/dataSources/local/Local_Data_Source.dart';
import 'package:movie_app_tmdb/App/data/dataSources/local/Local_Hive_Data.dart';

//* Cast Profile
import 'package:movie_app_tmdb/App/presentation/Cast_Profile_Section.dart/Cast_Profile_Controller.dart';

//* Home Controller
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

//* Movie Details Controller
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Movie_Details_Controller.dart';

//* Http for Client
import 'package:http/http.dart';

//* Api Client
import 'package:movie_app_tmdb/App/data/dataSources/Core/ApiClient.dart';

//* Remote data Sources
import 'package:movie_app_tmdb/App/data/dataSources/remote/remote_data_sources.dart';

//* Movie Repository
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';
import 'package:movie_app_tmdb/App/data/repositories/Movie_Repositotry_Impl.dart';

//* Watch Trailer
import 'package:movie_app_tmdb/App/presentation/WatchTrailerPage/Watch_Trailer_Controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Client _client = Client();
    ApiClient client = ApiClient(_client);
    LocalHiveData hiveDb = LocalHiveDataImpl();
    LocalDatabase localDatabase = LocalDatabase.localDatabase;
    LocalDataSource localDataSource = LocalDataSourceImpl(localDatabase);
    MovieRemoteDataSources dataSources = MovieRemoteDataSourcesImple(client);

    MovieRepository _movieRepository =
        MovieRepositoryImpl(dataSources, localDataSource, hiveDb);

    Get.lazyPut<HomeController>(() => HomeController(_movieRepository));
  }

  void movieDetailsPage(
      {required MovieRepository movieRepository,
      required int movieID,
      required bool favouriteMovie,
      required int index}) {
    Get.lazyPut<MovieDetailsController>(() => MovieDetailsController(
        movieRepository, movieID, favouriteMovie, index));
  }

  void movieTrailerPage({required videoEntity}) {
    Get.lazyPut<WatchTrailerControlller>(
        () => WatchTrailerControlller(videoEntity: videoEntity));
  }

  void castDetailsPage(
      {required int personID, required MovieRepository movieRepository}) {
    Get.lazyPut<CastProfileController>(() => CastProfileController(
        personId: personID, movieRepository: movieRepository));
  }
}
