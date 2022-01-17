import 'package:flutter/material.dart';

class MovieMenuArgument {
 
  final Color backgroundColor;
  final Color dividerColor;
  final TextStyle selectedItemStyle;
  final TextStyle noneSelectedItemStyle;
  final List movieMenuList;

  MovieMenuArgument( this.backgroundColor, this.dividerColor,
      this.selectedItemStyle, this.noneSelectedItemStyle, this.movieMenuList);
}
