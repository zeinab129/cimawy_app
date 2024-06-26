import 'package:cimawy/config.dart';
import 'package:cimawy/core/enums/enums.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_images.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cimawy/features/home/presentation/widgets/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilteredMoviesListScreen extends StatelessWidget {
  String genId;

  FilteredMoviesListScreen({super.key, required this.genId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeBloc>()..add(HomeEvent.getFilteredMovies(genId)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bgColor,
              elevation: 0.0,
            ),
            body: Padding(
              padding:
                  EdgeInsets.only(bottom: 12.0.r, left: 32.0.r, right: 32.0.r),
              child: state.getFilteredMoviesStatus == RequestStatus.failure
                  ? Center(
                      child: Text(
                      state.filteredMoviesFailure?.message ?? AppStrings.wrong,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ))
                  : state.getFilteredMoviesStatus == RequestStatus.success
                      ? state.filteredMoviesModel!.results!.length == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.ic_movie),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  AppStrings.no_movies,
                                  style: Styles.viewMovieStyle.copyWith(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.68)),
                                )
                              ],
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  height: 1,
                                  color: AppColors.greyColor,
                                );
                              },
                              itemBuilder: (context, index) {
                                return MovieListItem(
                                  movie: state
                                      .filteredMoviesModel!.results![index],
                                  isFiltered: true,
                                );
                              },
                              itemCount:
                                  state.filteredMoviesModel!.results!.length,
                            )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
          );
        },
      ),
    );
  }
}
