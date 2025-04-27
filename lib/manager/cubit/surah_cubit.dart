import 'package:al_huda/manager/state/surah_state.dart';
import 'package:al_huda/network/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahCubit extends Cubit<SurahState> {
  ApiServices apiServices = ApiServices();

  SurahCubit() : super(InitialState());

  getSurah() async {
    try {
      var json = await apiServices.get(
          endpoint: 'https://api.alquran.cloud/v1/quran/quran-uthmani');
      var surahs = json['data']['surahs'];
      //print(surahs);
      emit(
        SuccessState(surah: surahs),
      );
    } catch (e) {
      emit(
        ErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
