import 'dart:io';

import 'package:animetv/features/adminpanel/domain/adminusecase.dart';
import 'package:animetv/features/adminpanel/domain/entity/anime_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'admin_event.dart';
part 'admin_state.dart';

@lazySingleton
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminUsecase adminUsecase;
  AdminBloc(this.adminUsecase) : super(AdminInitial()) {
    on<AdminEvent>((event, emit) {});

    on<SetAnimeDataEvent>(handleSetAnimeData);
  }

  void handleSetAnimeData(
      SetAnimeDataEvent event, Emitter<AdminState> emit) async {
    try {
      emit(SetAnimeDataLoadingState());
      await adminUsecase.handleSetAnimeData(event.anime, event.file);
      emit(SetAnimeDataSuccessFullState());
    } catch (e) {
      print(e.toString());
      emit(SetAnimeDataFailureState(e.toString()));
    }
  }
}
