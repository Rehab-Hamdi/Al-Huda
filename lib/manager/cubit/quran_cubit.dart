import 'package:al_huda/manager/state/quran_state.dart';
import 'package:al_huda/network/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranCubit extends Cubit<QuranState> {
  ApiServices apiServices = ApiServices();

  QuranCubit() : super(InitialState());

  getQuran() async {
    try {
      emit(LoadingState());
      var json =
          await apiServices.get(endpoint: 'https://api.alquran.cloud/v1/surah');
      dynamic quran = json['data'];
      print('$quran');

      emit(SuccessState(quran: quran));
    } catch (error) {
      emit(
        ErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
