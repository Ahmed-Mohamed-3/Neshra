import 'package:hive_flutter/hive_flutter.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
part 'news_model.g.dart';

@HiveType(typeId: 2)
class NewsModel {
  @HiveField(0)
  String? status;

  @HiveField(1)
  num? totalResults;

  @HiveField(2)
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }
}

@HiveType(typeId: 3)
class Articles {
  @HiveField(0)
  Sources? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
