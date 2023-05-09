import 'package:moviesapp/domain/entities/video.dart';
import 'package:moviesapp/infrastructure/models/models.dart';

class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}
