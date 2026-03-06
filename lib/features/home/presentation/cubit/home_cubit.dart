import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:neshra/core/error/failure.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
import 'package:neshra/features/home/domain/use_cases/get_news_use_case.dart';
import 'package:neshra/features/home/domain/use_cases/get_sources_use_case.dart';
import 'package:neshra/features/home/presentation/cubit/home_states.dart';
@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.getSourcesUseCase, this.getNewsUseCase)
    : super(HomeInitState());
  GetSourcesUseCase getSourcesUseCase;
  GetNewsUseCase getNewsUseCase;
  SourceModel? sourceModel;
  NewsModel? newsModel;
  int currentIndex = 0;
  bool? categoryClick;
  String? categoryName;
  String locale = "en";

  void getSources(String categoryId) async {
    emit(GetSourcesLoadingState());
    Either<Failure, SourceModel> result = await getSourcesUseCase.call(
      categoryId,
    );
    result.fold(
      (l) {
        emit(GetSourcesErrorState(l));
      },
      (r) {
        sourceModel = r;
        getNews(sourceModel?.sources?[currentIndex].id ?? "", locale);
        emit(GetSourcesSuccessState());
      },
    );
  }

  void getNews(String sourceId, String language) async {
    emit(GetNewsLoadingState());
    Either<Failure, NewsModel> result = await getNewsUseCase.call(
      sourceId,
      language,
    );
    result.fold(
      (l) {
        emit(GetNewsErrorState(l));
      },
      (r) {
        newsModel = r;
        emit(GetNewsSuccessState());
      },
    );
  }

  void getCurrentIndex() {
    emit(GetCurrentIndexState());
  }

  void changeTab(int index) {
    currentIndex = index;
    getNews(sourceModel?.sources?[currentIndex].id ?? "", locale);
    emit(GetCurrentIndexState());
  }

  void setCategoryName(String? name) {
    categoryName = name;
    emit(CategoryNameState());
  }

  void setCategoryClick(bool? click) {
    categoryClick = click;
    emit(CategoryClickState());
  }

  void setLocal(String locale){
    this.locale = locale;
    emit(SetLocaleState());
  }
}
