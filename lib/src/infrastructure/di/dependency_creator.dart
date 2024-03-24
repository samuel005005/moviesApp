import 'package:get/get.dart';
import 'package:moviesapp/src/infrastructure/datasources/movieDb/movie_datasource.dart';
import 'package:moviesapp/src/infrastructure/repositories/movies_repository_implemetation.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => MovieDataSource());
    Get.lazyPut(
        () => MoviesRepositoryImplementation(Get.find<MovieDataSource>()));
  }
}
