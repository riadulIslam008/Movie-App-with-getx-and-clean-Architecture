import 'package:flutter/material.dart';
import 'package:get/get.dart';

//* Utils
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';

//* Button
import 'package:movie_app_tmdb/App/Core/widgets/Button_Widget.dart';
import 'package:movie_app_tmdb/main.dart';
import 'package:wiredash/wiredash.dart';

void errorDialog(
    {required String error_message, required VoidCallback retryFunction}) {
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  Get.defaultDialog(
    barrierDismissible: false,
    backgroundColor: vulcan,
    radius: 8,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(error_message,
              textAlign: TextAlign.center, style: textStyle),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
              buttonText: RETRY_BUTTON,
              buttonStyle: textStyle,
              onPressed: retryFunction,
              buttonWidth: 85,
            ),
            SizedBox(width: 10),
            ButtonWidget(
              buttonText: FEED_BACK,
              buttonStyle: textStyle,
              onPressed: () {
                Get.back();
                Wiredash.of(MyApp.navigatorKey.currentContext!)!.show();
              },
              buttonWidth: 110,
            ),
          ],
        ),
      ],
    ),
  );
}
