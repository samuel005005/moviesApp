import 'package:moviesapp/domain/datasources/movies_datasource.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/domain/entities/video.dart';
import 'package:moviesapp/domain/repositories/movies_repository.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  late MoviesDataSource moviesDataSource;

  MoviesRepositoryImplementation(this.moviesDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return moviesDataSource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return moviesDataSource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesDataSource.searchMovies(query);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return moviesDataSource.getSimilarMovies(movieId);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return moviesDataSource.getYoutubeVideosById(movieId);
  }
}
