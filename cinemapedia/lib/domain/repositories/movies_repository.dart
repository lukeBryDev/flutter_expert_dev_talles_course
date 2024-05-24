import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}

/// api key
/// https://api.themoviedb.org/3/movie/550?api_key=0ecbbdfe1863d291f2c9742679407ed7