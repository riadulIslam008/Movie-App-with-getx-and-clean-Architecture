//* Packages
import 'package:flutter/material.dart';

//* GetX
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/Arguments/BackGround_Argument.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';

//* Controller
import 'package:movie_app_tmdb/App/presentation/HomePage/HomeController.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Cached_Image_Section.dart';

class BackGroundSection extends GetWidget<HomeController> {
  final BackGroundArgument backGroundArgument;
  
  const BackGroundSection({required this.backGroundArgument, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.backGroundImage.value.isNotEmpty
          ? SizedBox(
              height: backGroundArgument.screenHeight,
              width: backGroundArgument.screenWidth,
              child: CachedImageSection(
                black54: black54,
                errorIcon: Icons.error,
                imageUrl: controller.backGroundImage.value,
                loadingSpiner: Container(color: Colors.black),
                redColor: redColor,
                screenHeight: backGroundArgument.screenHeight,
                borderRadius: 0,
                screenWidth: backGroundArgument.screenWidth,
              ),
            )
          : Container(
              color: backGroundArgument.black,
            ),
    );
  }
}
