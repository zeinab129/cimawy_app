import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGenresUseCase {
  HomeRepo homeRepo;

  GetGenresUseCase(this.homeRepo);

  Future<Either<Failures, GenresModel>> call() => homeRepo.getGenres();
}
