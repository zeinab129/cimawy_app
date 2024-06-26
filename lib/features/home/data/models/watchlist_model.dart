import 'package:cimawy/features/home/data/models/movie_model.dart';

class WatchListModel{
  List<MovieDetailsModel>? movies = [];

  WatchListModel();

  WatchListModel.fromjson(dynamic json) {
    if (json['films'] != null) {
      movies = [];
      json['films'].forEach((v) {
        movies?.add(MovieDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['films'] = movies!.map((e) => e.toJson()).toList();
    return map;
  }
}