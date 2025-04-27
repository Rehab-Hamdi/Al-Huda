import 'package:al_huda/core/custom_widgets/hadith_item.dart';
import 'package:al_huda/core/utils/myConstants.dart';
import 'package:al_huda/manager/cubit/hadith_cubit.dart';
import 'package:al_huda/manager/state/hadith_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});
  static const String routeName = 'Hadeth Screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.appColor,
          title: const Text(
            'الاحاديث',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child:
              BlocBuilder<HadithCubit, HadithState>(builder: (context, state) {
            if (state is SuccessState) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  SliverList.separated(
                      itemBuilder: (c, index) => HadithItem(
                            hadithText:
                                "${state.hadiths[index]['hadithArabic']}",
                            hadithAuthor:
                                "${state.hadiths[index]['book']['writerName']}",
                            hadithChapter:    "${state.hadiths[index]['book']['writerDeath']}",
                          ),
                      separatorBuilder: (c, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: state.hadiths.length),
                ],
              );
            } else if (state is ErrorState) {
              return Column(
                spacing: 20,
                children: [
                  Center(child: Text('Error -> ${state.errorMessage}')),
                ],
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading...'),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
