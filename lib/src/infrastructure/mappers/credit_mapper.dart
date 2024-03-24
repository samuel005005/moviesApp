import 'package:moviesapp/src/domain/entities/actor.dart';
import 'package:moviesapp/src/infrastructure/models/moviedb/credits/credit.dart';

class ActorMapper {
  static const String _notProfilePath =
      'https://www.truckeradvisor.com/media/uploads/profilePics/notFound.jpg';
  static Actor actorDbToEntity(Cast castDB) => Actor(
        id: castDB.id,
        name: castDB.name,
        profilePath: castDB.profilePath != ''
            ? 'https://image.tmdb.org/t/p/w500${castDB.profilePath}'
            : _notProfilePath,
        character: castDB.character,
      );
}
