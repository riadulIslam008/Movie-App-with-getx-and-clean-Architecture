import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:wiredash/wiredash.dart';

class WiredashSector extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  const WiredashSector({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "tmdb-movie-app-m8nkkgu",
      secret: "Qt43lS3CFdJ6MYDSsBjPsYvmnY_zasTw",
      navigatorKey: navigatorKey,
      child: child,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: royalBlue,
        secondaryColor: voilet,

      ),
    );
  }
}
