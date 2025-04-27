abstract class QuranState {}

class InitialState extends QuranState {}

class LoadingState extends QuranState {}

class SuccessState extends QuranState {
  dynamic quran;
  SuccessState({required this.quran});
}

class ErrorState extends QuranState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
