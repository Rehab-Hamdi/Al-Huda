import 'package:al_huda/core/utils/myConstants.dart';
import 'package:al_huda/presentation/view/surah.dart';
import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  const QuranItem(
      {super.key,
      required this.number,
      required this.arName,
      required this.enName,
      required this.numberOfAya});

  final String number;
  final String arName;
  final String enName;
  final String numberOfAya;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => SurahScreen(
                arName: arName,
                number: number,
              ),
            ),
          );
        },
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.appColor,
                  child: Text(number),
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        arName,
                        style: const TextStyle(
                            color: MyColors.appColor, fontSize: 18),
                      ),
                      Text(enName),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    children: [
                      const Text(
                        'عدد ألايات',
                        style:
                            TextStyle(color: MyColors.appColor, fontSize: 19),
                      ),
                      Text(numberOfAya),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
