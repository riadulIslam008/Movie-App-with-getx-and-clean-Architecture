import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

class MovieInfo extends StatelessWidget {
  final IconData icon;
  final String value;
  const MovieInfo({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:screenWidth > 400? 400 * 0.22 : screenWidth * 0.22,
      child: Tooltip(
        message: "$value",
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Center(
                child: Icon(icon, size: 35, color: white54),
              ),
            ),
            SizedBox(height: 10),
            FittedBox(
              child: Text(
                value,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
