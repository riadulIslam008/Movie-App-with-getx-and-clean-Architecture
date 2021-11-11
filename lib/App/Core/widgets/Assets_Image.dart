import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/assets/assetsImage.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

class FileNotFound extends StatelessWidget {
  const FileNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Image.asset(
        FILE_NOT_FOUND,
        width: screenWidth,
      ),
    );
  }
}
