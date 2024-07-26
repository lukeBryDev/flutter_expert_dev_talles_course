import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastucture/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/credist_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDBDataSource extends ActorsDataSource {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);
    return castResponse.cast.map((e) => ActorMapper.castToEntity(e)).toList();
  }
}
