import 'package:al_huda/manager/state/prayer_time_state.dart';
import 'package:al_huda/network/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayerTimeCubit extends Cubit<AppState> {
  ApiServices apiServices = ApiServices();

  PrayerTimeCubit() : super(InitialState());

  getAllPrayerTimes() async {
    try {
      emit(LoadingState());
      var json = await apiServices.get(
          endpoint:
              'https://api.aladhan.com/v1/timingsByCity/15-02-2024?country=egypt&city=cairo');
      dynamic times = json['data'];
      print(times);

      emit(SuccessState(times: times));
    } catch (error) {
      emit(
        ErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
