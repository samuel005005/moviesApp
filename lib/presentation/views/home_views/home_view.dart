import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/presentation/providers/providers.dart';
import 'package:moviesapp/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upCommingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initLoading = ref.watch(initialLoadingProvider);

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upCommingMovies = ref.watch(upCommingMoviesProvider);

    return Stack(
      children: [
        Visibility(
          visible: initLoading,
          child: const FullScreenLoader(),
        ),
        Visibility(
          visible: !initLoading,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                floating: true,
                elevation: 0,
                automaticallyImplyLeading: true,
                flexibleSpace: CustomAppBar(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      children: [
                        MoviesSlideShow(movies: slideShowMovies),
                        MovieHorizontalListView(
                          movies: nowPlayingMovies,
                          title: "In Theaters",
                          subTitle: "On Monday 20",
                          loadNextPage: () => ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                        ),
                        MovieHorizontalListView(
                          movies: upCommingMovies,
                          title: "Comming Soon",
                          subTitle: "In this month",
                          loadNextPage: () => ref
                              .read(upCommingMoviesProvider.notifier)
                              .loadNextPage(),
                        ),
                        MovieHorizontalListView(
                          movies: popularMovies,
                          title: "Popular",
                          subTitle: "In this month",
                          loadNextPage: () => ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage(),
                        ),
                        MovieHorizontalListView(
                          movies: topRatedMovies,
                          title: "Top rated",
                          subTitle: "Of all times",
                          loadNextPage: () => ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage(),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
