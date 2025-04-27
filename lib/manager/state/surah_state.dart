abstract class SurahState {}

class InitialState extends SurahState {}

class LoadingState extends SurahState {}

class SuccessState extends SurahState {
  dynamic surah;
  SuccessState({required this.surah});
}

class ErrorState extends SurahState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
