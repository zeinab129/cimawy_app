import 'package:cimawy/core/api/api_manager.dart';
import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/data_sources/home_ds.dart';
import 'package:cimawy/features/home/data/data_sources/home_ds_impl.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/movie_videos_model.dart';
import 'package:cimawy/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDS homeDS;

  HomeRepoImpl(this.homeDS);

  @override
  Future<Either<Failures, MoviesModel>> getNewReleasesMovies() async {
    try {
      var result = await homeDS.getNewReleasesMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getPopularMovies() async {
    try {
      var result = await homeDS.getPopularMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getRecommendedMovies() async {
    try {
      var result = await homeDS.getRecommendedMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    try {
      var result = await homeDS.getMovieDetails(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getSimilarMovies(int movieId) async {
    try {
      var result = await homeDS.getSimilarMovies(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getSearchedMovies(
      String searchStr) async {
    try {
      var result = await homeDS.getSearchedMovies(searchStr);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getFilteredMovies(String genId) async {
    try {
      var result = await homeDS.getFilteredMovies(genId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GenresModel>> getGenres() async {
    try {
      var result = await homeDS.getGenres();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MovieVideosModel>> getMovieVideos(int movieId) async{
    try {
      var result = await homeDS.getMovieVideos(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
