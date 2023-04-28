import 'package:dio/dio.dart';
import 'package:moviesapp/config/constants/environament.dart';
import 'package:moviesapp/domain/datasources/movies_datasource.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/infrastructure/mappers/movie_mapper.dart';
import 'package:moviesapp/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.movieDbUrl,
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': Enviroment.movieDbLan,
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDBResponse = Moviedbresponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDbToEntity(movieDB))
        .toList();

    return movies;
  }
}
