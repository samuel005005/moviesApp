import 'package:get/get.dart';
import 'package:moviesapp/src/application/get_now_playing_movies.dart';

import 'movies_state.dart';

class MoviesController extends GetxController {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;

  final Rxn movieState = Rxn<MoviesState>(MoviesState());

  MoviesController(this._getNowPlayingMoviesUseCase);

  @override
  void onInit() async {
    super.onInit();
    getNowPlayingMovies(page: 1);
  }

  getNowPlayingMovies({int page = 1}) async {
    try {
      movieState.value = movieState.value.copyWith(isLoading: true);

      final movies = await _getNowPlayingMoviesUseCase.execute(page);

      movieState.value =
          movieState.value.copyWith(movies: movies, isLoading: false);
    } catch (error) {
      movieState.value =
          movieState.value.copyWith(error: error, isLoading: false);
    }
  }
}
