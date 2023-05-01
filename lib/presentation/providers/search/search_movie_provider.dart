import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/presentation/providers/providers.dart';

final searchQueryProvider = StateProvider<String>(
  (ref) => '',
);

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final searchMovieRepository = ref.read(movieRepositoryProvider);
  return SearchedMoviesNotifier(
      ref: ref, searchMovies: searchMovieRepository.searchMovies);
});

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallBack searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
