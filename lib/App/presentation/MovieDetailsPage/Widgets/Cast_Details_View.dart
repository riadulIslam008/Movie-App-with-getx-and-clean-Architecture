// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/Core/assets/NetworkImage.dart';
import 'package:movie_app_tmdb/App/presentation/MovieDetailsPage/Movie_Details_Controller.dart';

class CastDetails extends GetWidget<MovieDetailsController> {
  final List castList;
  const CastDetails({Key? key, required this.castList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: castList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return castList[index].profilePic == null
              ? SizedBox.shrink()
              : GestureDetector(
                  onTap: () {
                    controller.personaDetailsPage(personID: castList[index].id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 10),
                    child: Hero(
                       tag: castList[index].profilePic,
                       transitionOnUserGestures: true,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                baseImageUrl(path: castList[index].profilePic!.toString()),
                            height: 200,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            color: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  castList[index].castOrginalName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  castList[index].characterName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
