import 'package:flutter/material.dart';
import 'package:get/get.dart';

//* Utils File
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';

//* Button Widget
import 'package:movie_app_tmdb/App/Core/widgets/Button_Widget.dart';

void aboutDialogBox({required String description}) {
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  Get.defaultDialog(
    barrierDismissible: false,
    title: ABOUT,
    titleStyle: textStyle,
    backgroundColor: vulcan,
    radius: 8,
    content: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(description,
                textAlign: TextAlign.center, style: textStyle),
          ),
          SizedBox(height: 15),
          ButtonWidget(
            buttonText: OKAY_BUTTON,
            buttonStyle: textStyle,
            buttonWidth: 100,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    ),
  );
}
