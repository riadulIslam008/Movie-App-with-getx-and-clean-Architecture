import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_tmdb/App/rotues/App_routes.dart';

class ViewPort extends StatefulWidget {
  const ViewPort({Key? key}) : super(key: key);

  @override
  _ViewPortState createState() => _ViewPortState();
}

class _ViewPortState extends State<ViewPort> {
  @override
  void initState() {
    Get.offAll(Routes.Home);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
