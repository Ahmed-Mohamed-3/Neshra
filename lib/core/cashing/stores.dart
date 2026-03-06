import 'package:injectable/injectable.dart';
import 'package:neshra/core/cashing/hive_boxes.dart';
import 'package:neshra/core/cashing/hive_store.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';

@lazySingleton
class AppSettingsStore extends HiveStore<String> {
  AppSettingsStore() : super(HiveBoxes.appSettings);
}

@lazySingleton
class SourcesStore extends HiveStore<SourceModel?> {
  SourcesStore() : super(HiveBoxes.sources);
}

@lazySingleton
class NewsStore extends HiveStore<NewsModel?> {
  NewsStore() : super(HiveBoxes.news);
}
