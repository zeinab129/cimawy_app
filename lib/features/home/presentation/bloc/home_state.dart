part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int currentIndex,
    @Default(RequestStatus.init) RequestStatus getPopularMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getNewReleasesMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getRecommendedMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getMovieDetailsStatus,
    @Default(RequestStatus.init) RequestStatus getSimilarMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getSearchedMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getFilteredMoviesStatus,
    @Default(RequestStatus.init) RequestStatus getGenresStatus,
    @Default(RequestStatus.init) RequestStatus getMovieVideosStatus,
    MoviesModel? popularMoviesModel,
    MoviesModel? newReleaseMoviesModel,
    MoviesModel? recommendedMoviesModel,
    MovieDetailsModel? movieDetailsModel,
    MoviesModel? similarMoviesModel,
    MoviesModel? searchedMoviesModel,
    MoviesModel? filteredMoviesModel,
    GenresModel? genresModel,
    MovieVideosModel? movieVideosModel,
    Failures? popularMoviesFailure,
    Failures? newReleasesMoviesFailure,
    Failures? recommendedMoviesFailure,
    Failures? movieDetailsFailure,
    Failures? similarMoviesFailure,
    Failures? searchedMoviesFailure,
    Failures? filteredMoviesFailure,
    Failures? genresFailure,
    Failures? movieVideosFailure,
  }) = _HomeState;
}
