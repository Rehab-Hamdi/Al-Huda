import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';

class BottomIconsImage extends StatelessWidget {
   BottomIconsImage({super.key, required this.imageName, this.color});
  String imageName;
  Color? color;
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return Image.asset(
      imageName,
      color: color,
      height: screenHeight*0.04,
      width: screenWidth*0.08,
    );
  }
}
