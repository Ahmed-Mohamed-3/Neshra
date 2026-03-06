import 'package:neshra/core/error/failure.dart';

sealed class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {
  final Failure failure;

  GetSourcesErrorState(this.failure);
}

class GetNewsLoadingState extends HomeStates {}

class GetNewsSuccessState extends HomeStates {}

class GetNewsErrorState extends HomeStates {
  final Failure failure;

  GetNewsErrorState(this.failure);
}

class GetCurrentIndexState extends HomeStates {}

class CategoryClickState extends HomeStates {}

class CategoryNameState extends HomeStates {}
class SetLocaleState extends HomeStates {}
