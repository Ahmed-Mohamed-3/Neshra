import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
abstract class HomeRemoteDs {
  Future<SourceModel> getSources(String categoryId);

  Future<NewsModel> getNews(String sourceId,String language);
}
