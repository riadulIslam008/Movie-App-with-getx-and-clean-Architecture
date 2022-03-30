//* Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Assets_Image.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Button_Widget.dart';

//* Home Controller
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';

class ErrorImageSection extends GetWidget<HomeController> {
  const ErrorImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FileNotFound(),
        ButtonWidget(
          buttonText: "No Item Found!",
          onPressed: () {
            controller.callApi(
                movieMenuItem: MOVIE_MENU[controller.selectedIndex.value]);
          },
          buttonStyle: Theme.of(context).textTheme.subtitle1!,
          buttonWidth: screenWidth / 2,
        ),
        // SizedBox(height: screenHeight * 0.20)
      ],
    );
  }
}
