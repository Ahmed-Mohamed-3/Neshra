import 'package:fpdart/fpdart.dart';
import 'package:neshra/core/error/failure.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
abstract class HomeRepo {
  Future<Either<Failure, SourceModel>>  getSources(String categoryId);

  Future<Either<Failure,NewsModel>> getNews(String sourceId,String language);
}
