import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final movieRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: movieRepository.getActorsByMovie);
});

/*
{
  '12345': <Actor>[],
  '12346': <Actor>[],
  '12347': <Actor>[],
}
*/

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
