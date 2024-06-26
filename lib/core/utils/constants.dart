class Constants {
  static const String BASE_URL = "https://api.themoviedb.org";
  static const String AUTHORIZATION =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYjRmNzkyNzA5YTI0ZTliZWEyZTg4MTA3MzdiY2ZhNyIsIm5iZiI6MTcxOTA2NjIwNS43NjYzNiwic3ViIjoiNjYwMzEzOTA3NzA3MDAwMTQ5MDgyYjc2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.qCwS7jvqCdJYRctzLBJnnVBci1Pu0Dwqw2bbtt3sTM0";
  static const String IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500/";

  static const Map<String, String> headers = {
    "Authorization": AUTHORIZATION,
    "accept": "application/json"
  };

  static const Map<String, String> languageParam = {"language": "en-US"};

  static const Map<String, String> pageParam = {"page": "1"};



}
