import 'dart:convert';

import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/data/models/watchlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String listKey = "watchList";
  static WatchListModel model = WatchListModel();

  Future<void> addMovieItem(MovieDetailsModel movie) async {
    if (!model.movies!.contains(movie)) {
      model.movies?.add(movie);
      print(model.movies!.length);
    } else
      print("found");
    String json = jsonEncode(model.toJson());
    print(json);
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      await init.setString(listKey, json).then((value) =>
          getMovies().then((value) => print("list ${value.movies!.length}")));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<WatchListModel> getMovies() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? movies = prefs.getString(listKey);
      var json = jsonDecode(movies ?? "");
      model = WatchListModel.fromjson(json);
      return model;
    } catch (e) {
      print(e.toString());
    }
    return WatchListModel();
  }
}
