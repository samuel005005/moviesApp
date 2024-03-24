import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/src/domain/entities/actor.dart';

import 'actors_repository_provider.dart';

final actorsProvider =
    StateNotifierProvider<ActorNotifier, Map<String, List<Actor>>>((ref) {
  final getActorsByMovie = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorNotifier(
    getActorsByMovie: getActorsByMovie,
  );
});

typedef ActorCallBack = Future<List<Actor>> Function(String);

class ActorNotifier extends StateNotifier<Map<String, List<Actor>>> {
  bool isLoading = false;
  ActorCallBack getActorsByMovie;
  ActorNotifier({required this.getActorsByMovie}) : super({});

  Future<void> getActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActorsByMovie(movieId);
    state = {...state, movieId: actors};
  }
}
