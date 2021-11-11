import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

//* App Error
import 'package:movie_app_tmdb/App/Core/errors/AppError.dart';

//* Error Dialog
import 'package:movie_app_tmdb/App/Core/widgets/Error_Dialog.dart';

//* Cast Personal Entity
import 'package:movie_app_tmdb/App/domain/entites/Cast_Personal_Entity.dart';

//* Movie Param
import 'package:movie_app_tmdb/App/domain/entites/Movie_Param.dart';

//* Movie Repository
import 'package:movie_app_tmdb/App/domain/repositories/Movie_Repository.dart';

//*  Entity Use Case
import 'package:movie_app_tmdb/App/domain/useCases/get_Cast_Personal_Details.dart';

class CastProfileController extends GetxController {
  final MovieRepository movieRepository;
  final int personId;

  CastProfileController(
      {required this.movieRepository, required this.personId});

  CastPersonalEntity? castPersonalEntity;

  @override
  void onInit() {
    getPersonInfo();
    super.onInit();
  }

  void getPersonInfo() async {
    GetCastPersonalDetails getCastInfo =
        GetCastPersonalDetails(movieRepository);
    final Either<AppError, CastPersonalEntity> castInfo =
        await getCastInfo(MovieParam(personId));

    castInfo.fold((l) {
      errorDialog(
          error_message: l.errorMerrsage,
          retryFunction: () {
            Get.back();
            getPersonInfo();
          });
    }, (r) {
      castPersonalEntity = r;
      update();
    });
  }
}
