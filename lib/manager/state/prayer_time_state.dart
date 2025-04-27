abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  dynamic times;
  SuccessState({required this.times});
}

class ErrorState extends AppState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
