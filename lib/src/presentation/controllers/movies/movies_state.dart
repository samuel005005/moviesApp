import 'package:moviesapp/src/domain/entities/movie.dart';

class MoviesState {
  final bool isLoading;
  final List<Movie> movies;
  final String? error;
  final bool endReached;
  final int page;

  MoviesState({
    this.isLoading = false,
    this.movies = const [],
    this.error,
    this.endReached = false,
    this.page = 1,
  });

  MoviesState copyWith({
    bool? isLoading,
    List<Movie>? movies,
    String? error,
    bool? endReached,
    int? page,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      error: error ?? this.error,
      endReached: endReached ?? this.endReached,
      page: page ?? this.page,
    );
  }
}
