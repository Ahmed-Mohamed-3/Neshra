import 'package:injectable/injectable.dart';
import 'package:neshra/core/cashing/stores.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
@injectable
class HomeLocalDs {
  final SourcesStore sourcesStore;
  final NewsStore newsStore;

  HomeLocalDs(this.sourcesStore, this.newsStore);

  String _sourcesKey(String categoryId) => categoryId;

  String _newsKey(String sourceId, String language) => sourceId;

  Future<void> cacheSources(String categoryId, SourceModel model) =>
      sourcesStore.write(_sourcesKey(categoryId), model);

  Future<SourceModel?> getCachedSources(String categoryId) async =>
      await sourcesStore.read(_sourcesKey(categoryId));

  Future<void> cacheNews(String sourceId, String language, NewsModel model) =>
      newsStore.write(_newsKey(sourceId, language), model);

  Future<NewsModel?> getCachedNews(String sourceId, String language) async =>
      await newsStore.read(_newsKey(sourceId, language));
}
