//* Packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//* GetX
import 'package:get/get.dart';

//* Hive
import 'package:hive_flutter/hive_flutter.dart';

import 'package:movie_app_tmdb/App/Core/utils/const_string.dart';
import 'package:movie_app_tmdb/App/Core/widgets/Wiredash.dart';
import 'package:movie_app_tmdb/App/data/models/Hive/hive_db.dart';

import 'package:movie_app_tmdb/App/rotues/App_Pages.dart';

//* Text Theme
import 'package:movie_app_tmdb/App/theme/ThemeTextStyle.dart';

//* Bindings
import 'package:movie_app_tmdb/di/Binding.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter<FavouriteMovieListModel>(FavouriteMovieListModelAdapter());
   await Hive.openBox<FavouriteMovieListModel>(hiveDBname);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return WiredashSector(
      navigatorKey: navigatorKey,
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        title: 'TMDB Movie App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          splashColor: Colors.transparent,
          textTheme: textTheme,
        ),
        initialRoute: AppPages.INTIAL_ROUTE,
        getPages: AppPages.routes,
        // home: ViewPort(),
      ),
    );
  }
}
