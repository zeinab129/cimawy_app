import 'package:cimawy/features/home/data/models/movie_videos_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, MoviesModel>> getPopularMovies();
  Future<Either<Failures, MoviesModel>> getNewReleasesMovies();
  Future<Either<Failures, MoviesModel>> getRecommendedMovies();
  Future<Either<Failures, MovieDetailsModel>> getMovieDetails(int movieId);
  Future<Either<Failures, MoviesModel>> getSimilarMovies(int movieId);
  Future<Either<Failures, MoviesModel>> getSearchedMovies(String searchStr);
  Future<Either<Failures, MoviesModel>> getFilteredMovies(String genId);
  Future<Either<Failures, GenresModel>> getGenres();
  Future<Either<Failures, MovieVideosModel>> getMovieVideos(int movieId);
}
