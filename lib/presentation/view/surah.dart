import 'package:al_huda/core/utils/myConstants.dart';
import 'package:al_huda/manager/cubit/surah_cubit.dart';
import 'package:al_huda/manager/state/surah_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.arName, required this.number});
  static const String routeName = 'Surah Screen';
  final String arName;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appColor,
        title: Text(arName),
        centerTitle: true,
      ),
      body: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is SuccessState) {
            // Check if the fetched surah matches the selected one
            for (var surah in state.surah) {
              if (surah['number'].toString() == number) {
                var ayahs = surah['ayahs'] as List;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black, height: 2),
                          children: ayahs.expand<InlineSpan>((ayah) {
                            return [
                              TextSpan(
                                text: ayah['text'],
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: MyColors.appColor,
                                    border:
                                        Border.all(color: Colors.black, width: 1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${ayah['numberInSurah']}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
            return const Center(
              child: Text('Surah not found'),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text('Error -> ${state.errorMessage}'),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading...'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
