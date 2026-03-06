import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:neshra/core/error/exception.dart';
import 'package:neshra/core/error/failure.dart';
import 'package:neshra/core/network/network_info.dart';
import 'package:neshra/features/home/data/data_sourse/local/home_local_ds.dart';
import 'package:neshra/features/home/data/data_sourse/remote/home_remote_ds.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
import 'package:neshra/features/home/domain/repository/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDs remote;
  final HomeLocalDs local;
  final NetworkInfo networkInfo;

  HomeRepoImpl(this.remote, this.local, this.networkInfo);

  @override
  Future<Either<Failure, SourceModel>> getSources(String categoryId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.getSources(categoryId);
        await local.cacheSources(categoryId, response);
        return Right(response);
      } on NoInternetException {
        return const Left(NoInternetFailure());
      } on TimeoutException {
        return const Left(TimeoutFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(statusCode: e.statusCode));
      } catch (e) {
        final cached = await local.getCachedSources(categoryId);
        if (cached != null) return Right(cached);
        return const Left(UnknownFailure());
      }
    } else {
      final cached = await local.getCachedSources(categoryId);
      return Right(cached ?? SourceModel());
    }
  }

  @override
  Future<Either<Failure, NewsModel>> getNews(
    String sourceId,
    String language,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remote.getNews(sourceId, language);
        await local.cacheNews(sourceId, language, response);
        return Right(response);
      } on NoInternetException {
        return const Left(NoInternetFailure());
      } on TimeoutException {
        return const Left(TimeoutFailure());
      } on ServerException catch (e) {
        return Left(ServerFailure(statusCode: e.statusCode));
      } catch (_) {
        final cached = await local.getCachedNews(sourceId, language);
        if (cached != null) return Right(cached);
        return const Left(UnknownFailure());
      }
    } else {
      final cached = await local.getCachedNews(sourceId, language);
      return Right(cached ?? NewsModel());
    }
  }
}
