import 'package:cached_network_image/cached_network_image.dart';
import 'package:cimawy/config.dart';
import 'package:cimawy/config/routes/app_router.dart';
import 'package:cimawy/core/enums/enums.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/constants.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/data/models/videos_screen_model.dart';
import 'package:cimawy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cimawy/features/home/presentation/widgets/category_item.dart';
import 'package:cimawy/features/home/presentation/widgets/movie_item.dart';
import 'package:cimawy/features/home/presentation/widgets/poster_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsScreen extends StatelessWidget {
  int movieId;

  MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(HomeEvent.getMovieDetails(movieId))
        ..add(HomeEvent.getSimilarMovies(movieId))
        ..add(HomeEvent.getMovieVideos(movieId)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.bgColor,
              child: state.getMovieDetailsStatus == RequestStatus.failure
                  ? Center(
                      child: Text(
                      state.movieDetailsFailure?.message ?? AppStrings.wrong,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ))
                  : state.getMovieDetailsStatus == RequestStatus.success
                      ? Scaffold(
                          backgroundColor: AppColors.bgColor,
                          appBar: AppBar(
                            backgroundColor: AppColors.bgColor,
                            elevation: 0.0,
                            title: Text(
                              state.movieDetailsModel?.title ??
                                  AppStrings.movie_name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.movieNameStyle
                                  .copyWith(fontSize: 20.sp),
                            ),
                            centerTitle: true,
                          ),
                          body: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${Constants.IMAGE_BASE_URL}${state.movieDetailsModel?.backdropPath}",
                                      height: 217.h,
                                      width: 412.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                          child: SizedBox(
                                              width: 32.0.w,
                                              height: 32.0.h,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 4.r,
                                              ))),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: Colors.grey,
                                        child: const Icon(
                                          Icons.image_not_supported_rounded,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        List<String> videosKeys = [];
                                        for (var result in state
                                            .movieVideosModel!.results!) {
                                          videosKeys.add(result!.key!);
                                        }
                                        if (videosKeys.isEmpty) {
                                          const snackBar = SnackBar(
                                            content: Text(AppStrings.no_videos),
                                            backgroundColor: (Colors.black87),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                        Navigator.pushNamed(
                                            context, AppRoutesName.videos,
                                            arguments: VideosScreenModel(
                                                movieTitle: state
                                                        .movieDetailsModel
                                                        ?.title ??
                                                    AppStrings.movie_name,
                                                videosKeys: videosKeys));
                                      },
                                      child: Icon(
                                        Icons.play_circle_fill_rounded,
                                        color: AppColors.whiteColor,
                                        size: 64.r,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0.r, vertical: 13.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.movieDetailsModel?.title ??
                                            AppStrings.movie_name,
                                        style: Styles.movieNameStyle
                                            .copyWith(fontSize: 18.sp),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        state.movieDetailsModel?.releaseDate ??
                                            AppStrings.movie_rel_date,
                                        style: Styles.movieDateStyle,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          PosterItem(
                                            movie: state.movieDetailsModel,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 11.0.r),
                                              height: 199.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GridView.builder(
                                                    primary: true,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                            mainAxisExtent:
                                                                22.0,
                                                            mainAxisSpacing:
                                                                3.r,
                                                            crossAxisSpacing:
                                                                8.r),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return CategoryItem(
                                                          name: state
                                                                  .movieDetailsModel
                                                                  ?.genres?[
                                                                      index]
                                                                  .name ??
                                                              "");
                                                    },
                                                    itemCount: state
                                                        .movieDetailsModel
                                                        ?.genres
                                                        ?.length,
                                                  ),
                                                  Text(
                                                    state.movieDetailsModel
                                                            ?.overview ??
                                                        "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                    style:
                                                        Styles.viewMovieStyle,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate_rounded,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 30.r,
                                                      ),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Text(
                                                        state.movieDetailsModel
                                                                ?.voteAverage!
                                                                .toStringAsFixed(
                                                                    1) ??
                                                            "",
                                                        style: Styles
                                                            .movieNameStyle
                                                            .copyWith(
                                                                fontSize:
                                                                    18.sp),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 18.r),
                                  padding: EdgeInsets.all(12.r),
                                  width: double.infinity,
                                  color: AppColors.movieItemBgColor,
                                  height: 255.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.more_like,
                                        style: Styles.movieNameStyle
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      state.getSimilarMoviesStatus ==
                                              RequestStatus.failure
                                          ? Center(
                                              child: Text(
                                              state.similarMoviesFailure
                                                      ?.message ??
                                                  AppStrings.wrong,
                                              style: const TextStyle(
                                                  color: AppColors.whiteColor),
                                            ))
                                          : state.getSimilarMoviesStatus ==
                                                  RequestStatus.success
                                              ? Expanded(
                                                  child: ListView.builder(
                                                    itemBuilder:
                                                        (context, index) {
                                                      return MovieItem(
                                                        movie: state
                                                            .similarMoviesModel!
                                                            .results![index],
                                                        isDetailsScreen: true,
                                                      );
                                                    },
                                                    itemCount: state
                                                        .similarMoviesModel!
                                                        .results!
                                                        .length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                  ),
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                      : const Center(
                          child: CircularProgressIndicator(),
                        ));
        },
      ),
    );
  }
}
