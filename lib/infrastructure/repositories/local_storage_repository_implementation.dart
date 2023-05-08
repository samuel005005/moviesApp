import 'package:moviesapp/domain/datasources/local_stotage_datasource.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/domain/repositories/local_stotage_repository.dart';

class LocalStorageRepositoryImplementation extends LocalStorageRepository {
  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImplementation(this.localStorageDataSource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return localStorageDataSource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return localStorageDataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageDataSource.toggleFavorite(movie);
  }
}
