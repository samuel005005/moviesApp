import 'package:get/get.dart';
import 'package:moviesapp/src/application/get_now_playing_movies.dart';
import 'package:moviesapp/src/infrastructure/repositories/movies_repository_implemetation.dart';

import 'movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetNowPlayingMoviesUseCase(
        moviesRepository: Get.find<MoviesRepositoryImplementation>()));
    Get.lazyPut(() => MoviesController(Get.find<GetNowPlayingMoviesUseCase>()));
  }
}
