import 'package:moviesapp/domain/datasources/movies_datasource.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/domain/repositories/movies_repository.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  late MoviesDataSource moviesDataSource;

  MoviesRepositoryImplementation(this.moviesDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDataSource.getNowPlaying(page: page);
  }
}
