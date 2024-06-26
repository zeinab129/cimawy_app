import 'package:cimawy/config.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_images.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cimawy/features/home/presentation/pages/tabs/browse_tab.dart';
import 'package:cimawy/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:cimawy/features/home/presentation/pages/tabs/search_tab.dart';
import 'package:cimawy/features/home/presentation/pages/tabs/watchlist_tab.dart';
import 'package:cimawy/features/home/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(const HomeEvent.getPopularMovies())
        ..add(const HomeEvent.getNewReleasesMovies())
        ..add(const HomeEvent.getRecommendedMovies())
        ..add(const HomeEvent.getGenres()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.bgColor,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavBarItem(
                    index: 0,
                    currentIndex: state.currentIndex,
                    iconPath: AppImages.ic_home,
                    label: AppStrings.home_label),
                BottomNavBarItem(
                    index: 1,
                    currentIndex: state.currentIndex,
                    iconPath: AppImages.ic_search,
                    label: AppStrings.search_label),
                BottomNavBarItem(
                    index: 2,
                    currentIndex: state.currentIndex,
                    iconPath: AppImages.ic_browse,
                    label: AppStrings.browse_label),
                BottomNavBarItem(
                    index: 3,
                    currentIndex: state.currentIndex,
                    iconPath: AppImages.ic_watch,
                    label: AppStrings.watch_list_label),
              ],
              iconSize: 28.r,
              selectedFontSize: 8.sp,
              unselectedFontSize: 8.sp,
              currentIndex: state.currentIndex,
              onTap: (value) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeEvent.changeNavBar(value));
              },
            ),
            body: tabs[state.currentIndex],
          );
        },
      ),
    );
  }

  List<Widget> tabs = [
    const HomeTab(),
    SearchTab(),
    const BrowseTab(),
    const WatchListTab()
  ];
}
