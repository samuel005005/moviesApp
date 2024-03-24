import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:moviesapp/src/presentation/controllers/movies/movies_controller.dart';
import 'package:moviesapp/src/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  final MoviesController moviesController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Visibility(
            visible: moviesController.movieState.value.isLoading,
            child: const FullScreenLoader(),
          ),
          Visibility(
            visible: !moviesController.movieState.value.isLoading,
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
                          MoviesSlideShow(
                              movies: moviesController.movieState.value.movies),
                          MovieHorizontalListView(
                            movies: moviesController.movieState.value.movies,
                            title: "In Theaters",
                            subTitle: "On Monday 20",
                            loadNextPage: () {},
                          ),
                          MovieHorizontalListView(
                            movies: moviesController.movieState.value.movies,
                            title: "Comming Soon",
                            subTitle: "In this month",
                            loadNextPage: () {},
                          ),
                          MovieHorizontalListView(
                            movies: moviesController.movieState.value.movies,
                            title: "Popular",
                            subTitle: "In this month",
                            loadNextPage: () {},
                          ),
                          MovieHorizontalListView(
                            movies: moviesController.movieState.value.movies,
                            title: "Top rated",
                            subTitle: "Of all times",
                            loadNextPage: () {},
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
      ),
    );
  }
}
