import 'dart:io';

import 'package:animetv/features/adminpanel/data/admin_repository.dart';
import 'package:animetv/features/adminpanel/domain/entity/anime_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdminUsecase {
  final AdminRepository repository;

  AdminUsecase(this.repository);

  Future<dynamic> handleSetAnimeData(AnimeEntity data,File imagefile) async {
    try {
      return await repository.setAnimeData(data.toJson(),imagefile);
    } catch (e) {
      rethrow;
    }
  }
}
