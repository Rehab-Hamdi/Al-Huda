import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';

class PrayerTimesModel extends StatelessWidget {
  PrayerTimesModel(
      {required this.imageName,
      required this.prayerName,
      required this.prayerTime,
      super.key});
  String imageName;
  String prayerName;
  String prayerTime;
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return Column(
      children: [
        Container(
          height: screenHeight * 0.06,
          width: screenWidth * 0.18,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(imageName),
            fit: BoxFit.contain,
          )),
        ),
        Text(prayerName, style: const TextStyle(fontSize: 18),),
        Text(
          prayerTime,
          style: const TextStyle(color:  Color(0xFFb7935f), fontSize: 19),
        ),
      ],
    );
  }
}
