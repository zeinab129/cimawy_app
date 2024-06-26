import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecommendedMoviesUseCase {
  HomeRepo homeRepo;

  GetRecommendedMoviesUseCase(this.homeRepo);

  Future<Either<Failures, MoviesModel>> call() =>
      homeRepo.getRecommendedMovies();
}