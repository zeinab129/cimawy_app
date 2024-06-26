// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'features/home/data/data_sources/home_ds.dart' as _i4;
import 'features/home/data/data_sources/home_ds_impl.dart' as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i7;
import 'features/home/domain/repositories/home_repo.dart' as _i6;
import 'features/home/domain/use_cases/get_filtered_movies_use_case.dart'
    as _i8;
import 'features/home/domain/use_cases/get_genres_use_case.dart' as _i9;
import 'features/home/domain/use_cases/get_movie_details_use_case.dart' as _i10;
import 'features/home/domain/use_cases/get_movie_videos_use_case.dart' as _i11;
import 'features/home/domain/use_cases/get_new_releases_movies_use_case.dart'
    as _i12;
import 'features/home/domain/use_cases/get_popular_movies_use_case.dart'
    as _i13;
import 'features/home/domain/use_cases/get_recommended_movies_use_case.dart'
    as _i14;
import 'features/home/domain/use_cases/get_searched_movies_use_case.dart'
    as _i15;
import 'features/home/domain/use_cases/get_similar_movies_use_case.dart'
    as _i16;
import 'features/home/presentation/bloc/home_bloc.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.HomeDS>(() => _i5.HomeDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(gh<_i4.HomeDS>()));
    gh.factory<_i8.GetFilteredMoviesUseCase>(
        () => _i8.GetFilteredMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i9.GetGenresUseCase>(
        () => _i9.GetGenresUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i10.GetMovieDetailsUseCase>(
        () => _i10.GetMovieDetailsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i11.GetMovieVideosUseCase>(
        () => _i11.GetMovieVideosUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i12.GetNewReleasesMoviesUseCase>(
        () => _i12.GetNewReleasesMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i13.GetPopularMoviesUseCase>(
        () => _i13.GetPopularMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i14.GetRecommendedMoviesUseCase>(
        () => _i14.GetRecommendedMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i15.GetSearchedMoviesUseCase>(
        () => _i15.GetSearchedMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i16.GetSimilarMoviesUseCase>(
        () => _i16.GetSimilarMoviesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i17.HomeBloc>(() => _i17.HomeBloc(
          getPopularMoviesUseCase: gh<_i13.GetPopularMoviesUseCase>(),
          getNewReleasesMoviesUseCase: gh<_i12.GetNewReleasesMoviesUseCase>(),
          getRecommendedMoviesUseCase: gh<_i14.GetRecommendedMoviesUseCase>(),
          getMovieDetailsUseCase: gh<_i10.GetMovieDetailsUseCase>(),
          getSimilarMoviesUseCase: gh<_i16.GetSimilarMoviesUseCase>(),
          getSearchedMoviesUseCase: gh<_i15.GetSearchedMoviesUseCase>(),
          getFilteredMoviesUseCase: gh<_i8.GetFilteredMoviesUseCase>(),
          getGenresUseCase: gh<_i9.GetGenresUseCase>(),
          getMovieVideosUseCase: gh<_i11.GetMovieVideosUseCase>(),
        ));
    return this;
  }
}
