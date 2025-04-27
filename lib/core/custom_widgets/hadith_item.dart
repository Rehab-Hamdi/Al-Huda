import 'package:al_huda/core/utils/myConstants.dart';
import 'package:flutter/material.dart';

class HadithItem extends StatelessWidget {
  const HadithItem(
      {super.key,
      required this.hadithText,
      required this.hadithAuthor,
      required this.hadithChapter});
  final String hadithText;
  final String hadithAuthor;
  final String hadithChapter;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: const TextStyle(
                      fontSize: 18, color: Colors.black, height: 1.5),
                  text: hadithText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 5, 18, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hadithAuthor,
                  style: const TextStyle(color: MyColors.appColor, fontSize: 15),
                ),
                Text(
                  hadithChapter,
                  style: const TextStyle(color: MyColors.appColor, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
