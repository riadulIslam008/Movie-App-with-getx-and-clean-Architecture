import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/BlurSection_Argument.dart';

class BlurSection extends StatelessWidget {
  // final Color color;
  // final double sigmaX;
  // final double sigmaY;
  final BlurSectionArgument blurSectionArgument;
  const BlurSection({Key? key, required this.blurSectionArgument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: blurSectionArgument.sigmaX,
          sigmaY: blurSectionArgument.sigmaY),
      child: Container(
        color: blurSectionArgument.color,
      ),
    );
  }
}
