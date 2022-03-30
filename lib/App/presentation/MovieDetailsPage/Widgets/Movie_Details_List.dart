import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';

class MovieDetailsList extends StatelessWidget {
  final double screenHeight;
  final String movieName;
  final List movieGenres;

  const MovieDetailsList({
    Key? key,
    required this.screenHeight,
    required this.movieName,
    required this.movieGenres,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerCliper(),
      child: Container(
        padding: EdgeInsets.only(left: screenWidth > 400? 400 * 0.32: screenWidth* 0.32),
        color: vulcan,
        height: screenHeight * 0.12,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                   
                    children: [
                      for (var i = 0; i < movieGenres.length; i++)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (i != 0)
                              Icon(Icons.linear_scale_rounded,
                                  color: royalBlue, size: 18),
                            Text(
                              "${ movieGenres[i].name }",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width * 0.27, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
