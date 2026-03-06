import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neshra/core/network/api_manager.dart';
import 'package:neshra/core/network/endpoint.dart';
import 'package:neshra/features/home/data/data_sourse/remote/home_remote_ds.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
@Injectable(as: HomeRemoteDs)
class HomeRemoteDSImpl implements HomeRemoteDs {
  ApiManager apiManger;

  HomeRemoteDSImpl(this.apiManger);

  @override
  Future<SourceModel> getSources(String categoryId) async {
    Response response = await apiManger.getApi(
      Endpoint.source,
      params: {"category": categoryId},
    );
    SourceModel sourceModel = SourceModel.fromJson(response.data);

    return sourceModel;
  }

  @override
  Future<NewsModel> getNews(String sourceId, String language) async {
    Response response = await apiManger.getApi(
      Endpoint.everything,
      params: {"sources": sourceId, "language": language},
    );
    NewsModel newsModel = NewsModel.fromJson(response.data);
    return newsModel;
  }
}
