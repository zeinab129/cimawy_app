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

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();

  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 42.0.r, horizontal: 32.0.r),
          child: Column(
            children: [
              SizedBox(
                width: 343.w,
                height: 50.h,
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    searchString = value;
                    print(searchString);
                    setState(() {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEvent.getSearchedMovies(searchString));
                    });
                  },
                  style: Styles.movieNameStyle,
                  cursorColor: AppColors.whiteColor,
                  decoration: InputDecoration(
                    fillColor: AppColors.greyColor,
                    filled: true,
                    hintText: AppStrings.search,
                    hintStyle: Styles.movieNameStyle.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.45)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.r),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.whiteColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.r),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.whiteColor)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.r),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.whiteColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.r),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.whiteColor)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: searchString == ""
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
                                  color:
                                      AppColors.whiteColor.withOpacity(0.68)),
                            )
                          ],
                        )
                      : state.getSearchedMoviesStatus == RequestStatus.failure
                          ? Center(
                              child: Text(
                              state.searchedMoviesFailure?.message ??
                                  AppStrings.wrong,
                              style:
                                  const TextStyle(color: AppColors.whiteColor),
                            ))
                          : state.getSearchedMoviesStatus ==
                                  RequestStatus.success
                              ? state.searchedMoviesModel?.results?.length == 0
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          movie: state.searchedMoviesModel!
                                              .results![index],
                                          isFiltered: false,
                                        );
                                      },
                                      itemCount: state
                                          .searchedMoviesModel!.results!.length,
                                    )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ))
            ],
          ),
        );
      },
    );
  }
}
