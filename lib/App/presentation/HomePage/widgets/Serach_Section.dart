import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//* getx and HomeController
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/Search_Argument.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

class SearchSection extends GetWidget<HomeController> {
  final SearchArgument searchArgument;
  SearchSection({Key? key, required this.searchArgument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: searchArgument.screenHeight * 0.08,
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchArgument.searchController,
              style: searchArgument.textTheme,
              onSubmitted: (String text) {
                if (text.isNotEmpty) {
                  controller.showMovieMenuList.value = false;
                  controller.isExpanded.value = true;
                  controller.getSearchMovieList(
                      searchString: controller.searchController.value.text);
                }
              },
            
              cursorHeight: 22,
              cursorWidth: 4,
              decoration: InputDecoration(
                prefixIcon: Icon(searchArgument.searchIcon, color: searchArgument.white54),
                hintText: searchArgument.hintText,
                hintStyle: TextStyle(
                  color: searchArgument.white54,
                ),
                border: InputBorder.none,
              ),
              onChanged: (String text) {
                if (text.isEmpty) {
                  controller.isExpanded.value = false;
                  controller.showMovieMenuList.value = true;
                }
              },
            ),
          ),
          Obx(
            () => TextButton.icon(
              onPressed: () {
                controller.showMovieMenuList.value = true;
                controller.expandTile();
              },
              label: Text(controller.buttonName.value),
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}
