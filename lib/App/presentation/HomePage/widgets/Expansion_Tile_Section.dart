import 'package:flutter/material.dart';

//* Getx
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/MovieMenu_Argument.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/Search_Argument.dart';

//*Utils
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';

//* Home Controller
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

//* Menu Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/Movie_Menu_Section.dart';

//* Search Section
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/Serach_Section.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/Show_Search_Movie_List.dart';

class ExpansionTileSection extends GetWidget<HomeController> {
  const ExpansionTileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.034),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.zero,
                      elevation: 0,
                      animationDuration: Duration(milliseconds: 300),
                      children: [
                        ExpansionPanel(
                          backgroundColor: Colors.transparent,
                          headerBuilder: (context, isExpanded) => SearchSection(
                            searchArgument: SearchArgument(
                              hintText: "Search...",
                              searchIcon: Icons.search,
                              screenHeight: screenHeight,
                              black54: black54,
                              white54: white54,
                              black38: black38,
                              textTheme: Theme.of(context).textTheme.headline6!,
                              searchController: controller.searchController,
                            ),
                          ),
                          body: controller.showMovieMenuList.value
                              ? MovieMenuSection(
                                  movieMenuArgument: MovieMenuArgument(
                                    black54.withOpacity(0.9),
                                    Colors.white,
                                    Theme.of(context).textTheme.headline5!,
                                    Theme.of(context).textTheme.headline6!,
                                    MOVIE_MENU,
                                  ),
                                )
                              : ShowSearchMovieList(
                                  screenWidth: screenWidth,
                                ),
                          isExpanded: controller.isExpanded.value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
    
  }
}
