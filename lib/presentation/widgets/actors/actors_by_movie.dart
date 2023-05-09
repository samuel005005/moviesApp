import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/presentation/providers/providers.dart';

class ActorByMovie extends ConsumerWidget {
  final String movieId;
  const ActorByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorByMovie = ref.watch(actorsProvider);

    if (actorByMovie[movieId] == null) {
      return const CircularProgressIndicator.adaptive(strokeWidth: 2);
    }
    final actors = actorByMovie[movieId]!;

    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return Container(
            padding: const EdgeInsets.all(8),
            width: 135,
            child: Column(
              children: [
                // Actor Photo
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      actor.profilePath,
                      height: 150,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Name
                const SizedBox(height: 5),
                Text(actor.name, maxLines: 2),
                Text(
                  actor.character ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
