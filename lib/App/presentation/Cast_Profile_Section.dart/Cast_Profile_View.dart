import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';
import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/Core/utils/screenSize.dart';
import 'package:movie_app_tmdb/App/presentation/Cast_Profile_Section.dart/Cast_Profile_Controller.dart';
import 'package:movie_app_tmdb/App/presentation/loadingPage/LoadingSpiner.dart';

class CastProfileView extends StatelessWidget {
  const CastProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: screenWidth> 400? 400: screenWidth,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: vulcan,
          body: GetBuilder<CastProfileController>(
            builder: (controller) {
              if (controller.castPersonalEntity == null) {
                return LoadingSpiner();
              } else {
                final personInfo = controller.castPersonalEntity!;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: GestureDetector(
                    // onVerticalDragDown: (details) => Get.back(),
                    // onHorizontalDragDown:  (details) => Get.back(),
                    onHorizontalDragEnd: (details) => Get.back(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [vulcan.withOpacity(0.1), vulcan],
                            ),
                          ),
                          child: Hero(
                            tag: personInfo.profilePath,
                            transitionOnUserGestures: true,
                            child: CachedNetworkImage(
                              imageUrl: baseImageUrl(path: personInfo.profilePath),
                              height: screenHeight * 0.80,
                              width: screenWidth,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            personInfo.castName,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              personInfo.dateOfBirth.isEmpty
                                  ? ""
                                  : personInfo.dateOfBirth.substring(0, 11),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          trailing: SizedBox(
                            width: screenWidth * 0.30,
                            child: Text(
                              personInfo.placeOfBirth,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            BIOGRAPHY,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            personInfo.biography,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
