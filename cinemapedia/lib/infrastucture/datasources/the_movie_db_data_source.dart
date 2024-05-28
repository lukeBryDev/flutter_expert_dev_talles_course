import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastucture/mappers/movie_maper.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class TheMovieDBDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-CO'
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return movies;
  }
}
