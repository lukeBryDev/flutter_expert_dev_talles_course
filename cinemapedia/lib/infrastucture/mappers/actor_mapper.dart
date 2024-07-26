import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/credist_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        character: cast.character,
        profilePath: cast.profilePath != ''
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
      );
}
