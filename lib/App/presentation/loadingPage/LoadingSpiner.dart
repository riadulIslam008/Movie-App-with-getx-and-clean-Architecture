import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';

class LoadingSpiner extends StatelessWidget {
  const LoadingSpiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: white54,
        color: Colors.teal,
        strokeWidth: 5,
      ),
    );
  }
}
