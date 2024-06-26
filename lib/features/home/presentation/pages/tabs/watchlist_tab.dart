import 'package:cimawy/core/provider/my_provider.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_images.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/presentation/widgets/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding:
          EdgeInsets.only(left: 16.0.r, right: 16.0.r, top: 32.r, bottom: 14.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.wath_list,
            style: Styles.movieNameStyle.copyWith(fontSize: 22.sp),
          ),
          Expanded(
            child: provider.model.movies!.isEmpty
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.ic_movie),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          AppStrings.no_movies_add,
                          style: Styles.viewMovieStyle.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.68)),
                        )
                      ],
                    ),
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
                        movie: provider.model.movies![index],
                        isFiltered: true,
                      );
                    },
                    itemCount: provider.model.movies!.length,
                  ),
          )
        ],
      ),
    );
  }
}
