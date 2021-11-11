//* Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/BackGround_Argument.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/BlurSection_Argument.dart';

//* Utils File
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

//* Home Controller
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/Expansion_Tile_Section.dart';

//* Expansion Tile section

//* Load Spiner
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';

//* Back Ground Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/BackGroundSection.dart';

//* Blur Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/BlurSection.dart';

//* Fore Ground Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/ForeGroundSection.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackGroundSection(
            backGroundArgument: BackGroundArgument(
              black: Colors.black,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
          BlurSection(
            blurSectionArgument:
                BlurSectionArgument(blackWithOpacity, 5.0, 5.0),
          ),

          //* foreGroud Section
          Obx(
            () => controller.loadingSpiner.value
                ? LoadingSpiner()
                : ForeGroundSection(),
          ),

          //* Searchbar and Tile
          ExpansionTileSection(),
        ],
      ),
    );
  }
}
