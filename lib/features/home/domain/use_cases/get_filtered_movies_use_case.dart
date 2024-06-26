import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFilteredMoviesUseCase {
  HomeRepo homeRepo;

  GetFilteredMoviesUseCase(this.homeRepo);

  Future<Either<Failures, MoviesModel>> call(String genId) =>
      homeRepo.getFilteredMovies(genId);
}
