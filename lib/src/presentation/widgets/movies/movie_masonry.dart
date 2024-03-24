import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moviesapp/src/domain/entities/movie.dart';
import 'package:moviesapp/src/presentation/widgets/widgets.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({super.key, required this.movies, this.loadNextPage});

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () async {
        if (widget.loadNextPage == null) return;
        if (scrollController.position.pixels + 100 >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = (MediaQuery.of(context).size.width > 500) ? 4 : 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        crossAxisCount: count,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                MoviePosterLink(movie: widget.movies[index])
              ],
            );
          }
          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }
}
