import 'package:cimawy/core/api/api_manager.dart';
import 'package:cimawy/core/api/end_points.dart';
import 'package:cimawy/core/utils/constants.dart';
import 'package:cimawy/features/home/data/data_sources/home_ds.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/movie_videos_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDS)
class HomeDSImpl implements HomeDS {
  ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<MoviesModel> getPopularMovies() async {
    var response = await apiManager.getData(
        endPoint: EndPoints.popularMovies,
        params: Constants.languageParam,
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<MoviesModel> getNewReleasesMovies() async {
    var response = await apiManager.getData(
        endPoint: EndPoints.newReleasesMovies,
        params: Constants.languageParam,
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<MoviesModel> getRecommendedMovies() async {
    var response = await apiManager.getData(
        endPoint: EndPoints.recommendedMovies,
        params: Constants.languageParam,
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    var response = await apiManager.getData(
        endPoint: "${EndPoints.movieDetails}/$movieId",
        params: Constants.languageParam,
        header: Constants.headers);

    MovieDetailsModel movieDetailsModel =
        MovieDetailsModel.fromJson(response.data);
    return movieDetailsModel;
  }

  @override
  Future<MoviesModel> getSimilarMovies(int movieId) async {
    var response = await apiManager.getData(
        endPoint:
            "${EndPoints.movieDetails}/$movieId${EndPoints.similarMovies}",
        params: {...Constants.languageParam, ...Constants.pageParam},
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<MoviesModel> getSearchedMovies(String searchStr) async {
    var response = await apiManager.getData(
        endPoint: EndPoints.search,
        params: {
          ...Constants.languageParam,
          ...Constants.pageParam,
          ...{"query": searchStr}
        },
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<MoviesModel> getFilteredMovies(String genId) async {
    var response = await apiManager.getData(
        endPoint: EndPoints.filteredMovies,
        params: {
          ...Constants.languageParam,
          ...{"with_genres": genId}
        },
        header: Constants.headers);

    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }

  @override
  Future<GenresModel> getGenres() async {
    var response = await apiManager.getData(
        endPoint: EndPoints.genres,
        params: Constants.languageParam,
        header: Constants.headers);

    GenresModel genresModel = GenresModel.fromJson(response.data);
    return genresModel;
  }

  @override
  Future<MovieVideosModel> getMovieVideos(int movieId) async {
    var response = await apiManager.getData(
        endPoint: "${EndPoints.movieDetails}/$movieId${EndPoints.video}",
        params: Constants.languageParam,
        header: Constants.headers);

    MovieVideosModel movieVideosModel =
        MovieVideosModel.fromJson(response.data);
    return movieVideosModel;
  }
}
