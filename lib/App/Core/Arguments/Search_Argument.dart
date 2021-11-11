import 'package:flutter/material.dart';

class SearchArgument {
  final String hintText;
  final IconData searchIcon;
  final double screenHeight;
  final Color black54;
  final Color white54;
  final Color black38;
  final TextStyle textTheme;
  final TextEditingController searchController;

  SearchArgument(
      {required this.hintText,
      required this.searchIcon,
      required this.screenHeight,
      required this.black54,
      required this.white54,
      required this.black38,
      required this.textTheme,
      required this.searchController});
}
