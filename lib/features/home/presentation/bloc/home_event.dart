part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.changeNavBar(int index) = _ChangeNavBarEvent;

  const factory HomeEvent.getPopularMovies() = _GetPopularMoviesEvent;

  const factory HomeEvent.getNewReleasesMovies() = _GetNewReleasesMoviesEvent;

  const factory HomeEvent.getRecommendedMovies() = _GetRecommendedMoviesEvent;

  const factory HomeEvent.getMovieDetails(int movieId) = _GetMovieDetailsEvent;

  const factory HomeEvent.getSimilarMovies(int movieId) =
      _GetSimilarMoviesEvent;

  const factory HomeEvent.getSearchedMovies(String searchStr) =
      _GetSearchedMoviesEvent;

  const factory HomeEvent.getFilteredMovies(String genId) =
      _GetFilteredMoviesEvent;

  const factory HomeEvent.getGenres() = _GetGenresEvent;

  const factory HomeEvent.getMovieVideos(int movieId) = _GetMovieVideosEvent;
}
