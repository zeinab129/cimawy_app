import 'package:bloc/bloc.dart';
import 'package:cimawy/core/enums/enums.dart';
import 'package:cimawy/core/errors/failures.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/movie_videos_model.dart';
import 'package:cimawy/features/home/domain/use_cases/get_filtered_movies_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_genres_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_movie_details_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_movie_videos_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_new_releases_movies_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_recommended_movies_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_searched_movies_use_case.dart';
import 'package:cimawy/features/home/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetNewReleasesMoviesUseCase getNewReleasesMoviesUseCase;
  GetRecommendedMoviesUseCase getRecommendedMoviesUseCase;
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  GetSearchedMoviesUseCase getSearchedMoviesUseCase;
  GetFilteredMoviesUseCase getFilteredMoviesUseCase;
  GetGenresUseCase getGenresUseCase;
  GetMovieVideosUseCase getMovieVideosUseCase;

  HomeBloc(
      {required this.getPopularMoviesUseCase,
      required this.getNewReleasesMoviesUseCase,
      required this.getRecommendedMoviesUseCase,
      required this.getMovieDetailsUseCase,
      required this.getSimilarMoviesUseCase,
      required this.getSearchedMoviesUseCase,
      required this.getFilteredMoviesUseCase,
      required this.getGenresUseCase,
      required this.getMovieVideosUseCase})
      : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<_ChangeNavBarEvent>(
      (event, emit) {
        emit(state.copyWith(currentIndex: event.index));
      },
    );

    on<_GetPopularMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getPopularMoviesStatus: RequestStatus.loading));
        var result = await getPopularMoviesUseCase();
        result.fold((l) {
          emit(state.copyWith(
              getPopularMoviesStatus: RequestStatus.failure,
              popularMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getPopularMoviesStatus: RequestStatus.success,
              popularMoviesModel: r));
        });
      },
    );

    on<_GetNewReleasesMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getNewReleasesMoviesStatus: RequestStatus.loading));
        var result = await getNewReleasesMoviesUseCase();
        result.fold((l) {
          emit(state.copyWith(
              getNewReleasesMoviesStatus: RequestStatus.failure,
              newReleasesMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getNewReleasesMoviesStatus: RequestStatus.success,
              newReleaseMoviesModel: r));
        });
      },
    );

    on<_GetRecommendedMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getRecommendedMoviesStatus: RequestStatus.loading));
        var result = await getRecommendedMoviesUseCase();
        result.fold((l) {
          emit(state.copyWith(
              getRecommendedMoviesStatus: RequestStatus.failure,
              recommendedMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getRecommendedMoviesStatus: RequestStatus.success,
              recommendedMoviesModel: r));
        });
      },
    );

    on<_GetMovieDetailsEvent>(
      (event, emit) async {
        emit(state.copyWith(getMovieDetailsStatus: RequestStatus.loading));
        var result = await getMovieDetailsUseCase(event.movieId);
        result.fold((l) {
          emit(state.copyWith(
              getMovieDetailsStatus: RequestStatus.failure,
              movieDetailsFailure: l));
        }, (r) {
          emit(state.copyWith(
              getMovieDetailsStatus: RequestStatus.success,
              movieDetailsModel: r));
        });
      },
    );

    on<_GetSimilarMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getSimilarMoviesStatus: RequestStatus.loading));
        var result = await getSimilarMoviesUseCase(event.movieId);
        result.fold((l) {
          emit(state.copyWith(
              getSimilarMoviesStatus: RequestStatus.failure,
              similarMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getSimilarMoviesStatus: RequestStatus.success,
              similarMoviesModel: r));
        });
      },
    );

    on<_GetSearchedMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getSearchedMoviesStatus: RequestStatus.loading));
        var result = await getSearchedMoviesUseCase(event.searchStr);
        result.fold((l) {
          emit(state.copyWith(
              getSearchedMoviesStatus: RequestStatus.failure,
              searchedMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getSearchedMoviesStatus: RequestStatus.success,
              searchedMoviesModel: r));
        });
      },
    );

    on<_GetFilteredMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(getFilteredMoviesStatus: RequestStatus.loading));
        var result = await getFilteredMoviesUseCase(event.genId);
        result.fold((l) {
          emit(state.copyWith(
              getFilteredMoviesStatus: RequestStatus.failure,
              filteredMoviesFailure: l));
        }, (r) {
          emit(state.copyWith(
              getFilteredMoviesStatus: RequestStatus.success,
              filteredMoviesModel: r));
        });
      },
    );

    on<_GetGenresEvent>(
      (event, emit) async {
        emit(state.copyWith(getGenresStatus: RequestStatus.loading));
        var result = await getGenresUseCase();
        result.fold((l) {
          emit(state.copyWith(
              getGenresStatus: RequestStatus.failure, genresFailure: l));
        }, (r) {
          emit(state.copyWith(
              getGenresStatus: RequestStatus.success, genresModel: r));
        });
      },
    );

    on<_GetMovieVideosEvent>(
      (event, emit) async {
        emit(state.copyWith(getMovieVideosStatus: RequestStatus.loading));
        var result = await getMovieVideosUseCase(event.movieId);
        result.fold((l) {
          emit(state.copyWith(
              getMovieVideosStatus: RequestStatus.failure,
              movieVideosFailure: l));
        }, (r) {
          emit(state.copyWith(
              getMovieVideosStatus: RequestStatus.success,
              movieVideosModel: r));
        });
      },
    );
  }
}
