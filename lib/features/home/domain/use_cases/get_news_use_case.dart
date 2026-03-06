import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:neshra/core/error/failure.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/domain/repository/home_repo.dart';

@injectable
class GetNewsUseCase {
  HomeRepo repo;

  GetNewsUseCase(this.repo);

  Future<Either<Failure, NewsModel>>  call(String sourceId,String language) => repo.getNews(sourceId,language);

}
