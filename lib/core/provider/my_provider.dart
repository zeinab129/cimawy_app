import 'dart:convert';

import 'package:cimawy/core/cache/shared_pref.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/watchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  int index = 0;
  int carouselCurrentIndex = 0;
  WatchListModel model = WatchListModel();
  SharedPref pref = SharedPref();

  void changeIndex(int currentIndex) {
    index = currentIndex;
    notifyListeners();
  }

  void changeCarouselIndex(int currentIndex) {
    carouselCurrentIndex = currentIndex;
    notifyListeners();
  }

  Future<void> getWatchList() async {
    WatchListModel listMovies = await pref.getMovies();
    model = listMovies;
    notifyListeners();
  }

  void addToWatchList(MovieDetailsModel movie) async {
    await pref.addMovieItem(movie);
    getWatchList();
    notifyListeners();
  }

  bool isMovieAdded(MovieDetailsModel movie) {
    bool isAdded = false;
    model.movies!.forEach((element) {
      if (element.id == movie.id) {
        isAdded = true;
      }
    });
    return isAdded;
  }
}
