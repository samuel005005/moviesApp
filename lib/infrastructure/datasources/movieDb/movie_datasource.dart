import 'package:dio/dio.dart';

import 'package:moviesapp/config/constants/environament.dart';
import 'package:moviesapp/domain/datasources/movies_datasource.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/infrastructure/mappers/movie_mapper.dart';
import 'package:moviesapp/infrastructure/models/models.dart';

class MovieDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.movieDbUrl,
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': Enviroment.movieDbLan,
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MoviedbresponseDB.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDbToEntity(movieDB))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with Id: $id not found');
    }

    final movieDetails = MovieDetailDB.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailDbToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );
    return _jsonToMovies(response.data);
  }
}
