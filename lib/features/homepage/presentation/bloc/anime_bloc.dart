import 'package:animetv/features/homepage/data/model/anime_model.dart';
import 'package:animetv/features/homepage/data/repository/anime_repository.dart';
import 'package:animetv/features/homepage/domain/animeusecase.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'anime_event.dart';
part 'anime_state.dart';

@lazySingleton
class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeUsecase animeUsecase;
  AnimeBloc(this.animeUsecase) : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit) {});
    on<GetAnimeEvent>((handleGetAnime));
  }

  void handleGetAnime(GetAnimeEvent event, Emitter<AnimeState> emit) async {
    List<AnimeModel> anime = [];
    try {
      emit(GetAnimeLoadingState());

      var response = await animeUsecase.handleAnimeUsecase();
      var data = response.docs;

      for (var i = 0; i < data.length; i++) {
        anime.add(AnimeModel.fromJson(data[i].data()));
      }

      emit(GetAnimeSuccessFullState(anime));
    } catch (e) {
      emit(GetAnimeFailureState(e.toString()));
    }
  }
}
