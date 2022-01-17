import 'package:flutter/material.dart';

//* Getx and Controller
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/MovieMenu_Argument.dart';
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';
import 'package:wiredash/wiredash.dart';

class MovieMenuSection extends GetWidget<HomeController> {
  final MovieMenuArgument movieMenuArgument;
  const MovieMenuSection({
    Key? key,
    required this.movieMenuArgument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.3),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < movieMenuArgument.movieMenuList.length; i++)
            Column(
              children: [
                InkWell(
                  onTap: () {
                    if (i == 5) Wiredash.of(context)!.show();
                    controller.getdataFromApi(index: i);
                  },
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        movieMenuArgument.movieMenuList[i],
                        style: controller.selectedIndex.value == i
                            ? movieMenuArgument.selectedItemStyle
                            : movieMenuArgument.noneSelectedItemStyle,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: movieMenuArgument.dividerColor,
                  thickness: 1,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
