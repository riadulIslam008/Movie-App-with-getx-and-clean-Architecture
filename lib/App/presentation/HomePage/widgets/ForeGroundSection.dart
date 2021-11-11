//* Packages
import 'package:flutter/material.dart';

//* Utils File
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/widgets/MovieList_section.dart';

class ForeGroundSection extends StatelessWidget {
  const ForeGroundSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.12),
        MovieListSection(),
      ],
    );
  }
}
