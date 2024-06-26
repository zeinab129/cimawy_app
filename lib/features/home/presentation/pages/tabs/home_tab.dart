import 'package:cimawy/core/enums/enums.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/presentation/widgets/movie_item.dart';
import 'package:cimawy/features/home/presentation/widgets/popular_movie_item.dart';
import 'package:cimawy/features/home/presentation/widgets/release_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../bloc/home_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            state.getPopularMoviesStatus == RequestStatus.failure
                ? Center(
                    child: Text(
                    state.popularMoviesFailure?.message ?? AppStrings.wrong,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ))
                : state.getPopularMoviesStatus == RequestStatus.success
                    ? ImageSlideshow(
                        width: double.infinity,
                        height: 290.h,
                        initialPage: 0,
                        autoPlayInterval: 5000,
                        indicatorColor: Colors.transparent,
                        indicatorPadding: 0.0,
                        indicatorBackgroundColor: Colors.transparent,
                        isLoop: true,
                        children: state.popularMoviesModel!.results!
                            .map((movie) => PopularMovieItem(
                                  movie: movie,
                                ))
                            .toList())
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
            Container(
              margin: EdgeInsets.only(top: 24.r),
              padding: EdgeInsets.all(12.r),
              width: double.infinity,
              color: AppColors.movieItemBgColor,
              height: 188.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.new_releases,
                    style: Styles.movieNameStyle.copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  state.getNewReleasesMoviesStatus == RequestStatus.failure
                      ? Center(
                          child: Text(
                          state.newReleasesMoviesFailure?.message ??
                              AppStrings.wrong,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ))
                      : state.getNewReleasesMoviesStatus ==
                              RequestStatus.success
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ReleaseMovieItem(
                                    movie: state
                                        .newReleaseMoviesModel!.results![index],
                                  );
                                },
                                itemCount: state
                                    .newReleaseMoviesModel!.results!.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.r, bottom: 16.r),
              padding: EdgeInsets.all(12.r),
              width: double.infinity,
              color: AppColors.movieItemBgColor,
              height: 250.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.recommended,
                    style: Styles.movieNameStyle.copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  state.getRecommendedMoviesStatus == RequestStatus.failure
                      ? Center(
                          child: Text(
                          state.recommendedMoviesFailure?.message ??
                              AppStrings.wrong,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ))
                      : state.getRecommendedMoviesStatus ==
                              RequestStatus.success
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return MovieItem(
                                    movie: state.recommendedMoviesModel!
                                        .results![index],
                                    isDetailsScreen: false,
                                  );
                                },
                                itemCount: state
                                    .recommendedMoviesModel!.results!.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
