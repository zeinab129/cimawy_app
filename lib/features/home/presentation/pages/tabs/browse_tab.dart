import 'package:cimawy/core/enums/enums.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cimawy/features/home/presentation/widgets/gen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 32.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.browse_cat,
                style: Styles.movieNameStyle.copyWith(fontSize: 22.sp),
              ),
              state.getGenresStatus == RequestStatus.failure
                  ? Center(
                      child: Text(
                      state.genresFailure?.message ?? AppStrings.wrong,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ))
                  : state.getGenresStatus == RequestStatus.success
                      ? Expanded(
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 38.r,
                                mainAxisSpacing: 47.r,
                                mainAxisExtent: 99.h,
                              ),
                              itemBuilder: (context, index) {
                                return GenItem(
                                  genre: state.genresModel!.genres![index],
                                );
                              },
                              itemCount: state.genresModel!.genres!.length,
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
            ],
          ),
        );
      },
    );
  }
}
