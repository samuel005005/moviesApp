import 'package:isar/isar.dart';
part 'actor.g.dart';

@collection
class Actor {
  Id? isarId;
  final int id;
  final String name;
  final String profilePath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    this.character,
  });
}
