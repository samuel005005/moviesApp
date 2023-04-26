import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/infrastructure/datasources/moviedb_datasource.dart';
import 'package:moviesapp/infrastructure/repositories/movies_repository_implemetation.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImplementation(MovieDbDatasource());
});
