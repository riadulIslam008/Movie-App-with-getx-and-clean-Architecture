import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Movie_Details_Controller.dart';

class FavouriteIcon extends GetWidget<MovieDetailsController> {
  const FavouriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                controller.favouriteMovie.value =
                    !controller.favouriteMovie.value;
                controller.favouriteMovie.value
                    ? controller.addInFavouriteMovie()
                    : controller.deleteFavoriteMovie();
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  controller.favouriteMovie.value
                      ? CupertinoIcons.heart_circle_fill
                      : CupertinoIcons.heart,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
