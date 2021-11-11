import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/App/Core/utils/UtilsColors.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextStyle buttonStyle;
  final VoidCallback onPressed;
  final double buttonWidth;
  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.buttonStyle,
    required this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              royalBlue,
              voilet,
            ],
          ),
        ),
        child: MaterialButton(
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
