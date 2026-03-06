import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:neshra/core/error/failure.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
import 'package:neshra/features/home/domain/repository/home_repo.dart';

@injectable
class GetSourcesUseCase {
  HomeRepo repo;

  GetSourcesUseCase(this.repo);

  Future<Either<Failure, SourceModel>> call(String categoryId)=>repo.getSources(categoryId);
}