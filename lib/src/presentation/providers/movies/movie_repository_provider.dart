import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/src/infrastructure/datasources/movieDb/movie_datasource.dart';

import 'package:moviesapp/src/infrastructure/repositories/movies_repository_implemetation.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImplementation(MovieDataSource());
});
