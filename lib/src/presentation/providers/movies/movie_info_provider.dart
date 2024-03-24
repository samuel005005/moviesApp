import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/src/domain/entities/movie.dart';
import 'package:moviesapp/src/presentation/providers/providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifer, Map<String, Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifer(getMovie: getMovie);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifer extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;
  MovieMapNotifer({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
