import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/movie_videos_model.dart';

abstract class HomeDS{
  Future<MoviesModel> getPopularMovies();
  Future<MoviesModel> getNewReleasesMovies();
  Future<MoviesModel> getRecommendedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<MoviesModel> getSimilarMovies(int movieId);
  Future<MoviesModel> getSearchedMovies(String searchStr);
  Future<GenresModel> getGenres();
  Future<MoviesModel> getFilteredMovies(String searchStr);
  Future<MovieVideosModel> getMovieVideos(int movieId);
}