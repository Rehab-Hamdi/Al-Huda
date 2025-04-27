abstract class HadithState {}

class InitialState extends HadithState {}

class LoadingState extends HadithState {}

class SuccessState extends HadithState {
  dynamic hadiths;
  SuccessState({required this.hadiths});
}

class ErrorState extends HadithState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
