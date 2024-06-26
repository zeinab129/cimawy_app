import 'package:cimawy/core/components/reusable_components.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/videos_screen_model.dart';
import 'package:cimawy/features/home/presentation/pages/filtered_movies_list_screen.dart';
import 'package:cimawy/features/home/presentation/pages/home_screen.dart';
import 'package:cimawy/features/home/presentation/pages/movie_details_sreen.dart';
import 'package:cimawy/features/home/presentation/pages/movie_videos_screen.dart';
import 'package:flutter/material.dart';

class AppRoutesName {
  static const String home = "home";
  static const String details = "details";
  static const String filtered = "filtered";
  static const String videos = "videos";
}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case AppRoutesName.details:
        int movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movieId: movieId),
        );
      case AppRoutesName.filtered:
        String gen = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => FilteredMoviesListScreen(genId: gen),
        );
      case AppRoutesName.videos:
        VideosScreenModel videosScreenModel = settings.arguments as VideosScreenModel;
        return MaterialPageRoute(
          builder: (context) => MovieVideosScreen(videosScreenModel: videosScreenModel),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => UndefinedRoute(),
        );
    }
  }
}
