import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/src/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return HomeScreen(childView: child);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) {
    //         return const HomeView();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'movie/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) {
    //             final movieId = state.params['id'] ?? 'no-id';
    //             return MovieScreen(movieId: movieId);
    //           },
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: '/favorite',
    //       builder: (context, state) {
    //         return const FavoriteView();
    //       },
    //     )
    //   ],
    // ),
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.params['page'] ?? '0');
        if (pageIndex > 2 || pageIndex < 0) {
          return const Center(
            child: Text("Page not Found"),
          );
        }
        return const HomeScreen(
          pageIndex: 1,
          // pageIndex: pageIndex,
        );
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.params['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
