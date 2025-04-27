import 'package:al_huda/core/models/prayer_time_model.dart';
import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';

class PrayerTimeItem extends StatelessWidget {
  PrayerTimeItem({super.key, required this.prayerTimeModel});
  PrayerTimeModel prayerTimeModel;
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return Column(
      children: [
        Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(prayerTimeModel.imageName),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          prayerTimeModel.prayerName,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          prayerTimeModel.prayerTime,
          style: const TextStyle(color: Color(0xFFb7935f), fontSize: 19),
        ),
      ],
    );
  }
}
