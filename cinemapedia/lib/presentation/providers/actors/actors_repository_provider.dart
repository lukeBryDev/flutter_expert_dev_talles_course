import 'package:cinemapedia/infrastucture/datasources/actor_movie_db_data_source.dart';
import 'package:cinemapedia/infrastucture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDBDataSource());
});
