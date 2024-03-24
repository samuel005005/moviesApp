import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:moviesapp/src/presentation/controllers/movies/movies_controller.dart';
import 'package:moviesapp/src/presentation/widgets/widgets.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView>
    with AutomaticKeepAliveClientMixin {
  final MoviesController moviesController = Get.find();
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final popularMovies = moviesController.movieState.value.movies;

    if (popularMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return Scaffold(
      body: MovieMasonry(loadNextPage: () => {}, movies: popularMovies),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
