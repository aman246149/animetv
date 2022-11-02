import 'package:animetv/features/homepage/data/repository/anime_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class AnimeUsecase {
  final AnimeRepository repository;

  AnimeUsecase(this.repository);

  Future<dynamic> handleAnimeUsecase() async {
    try {
      return await repository.getAnime();
    } catch (e) {
      rethrow;
    }
  }
}
