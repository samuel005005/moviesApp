import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/domain/entities/movie.dart';

final searchQueryProvider = StateProvider<String>(
  (ref) => '',
);

// final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier,<List<Movie>>>((ref) => null);

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
