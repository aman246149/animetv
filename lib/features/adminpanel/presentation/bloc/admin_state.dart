part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class SetAnimeDataLoadingState extends AdminState {}

class SetAnimeDataSuccessFullState extends AdminState {}

class SetAnimeDataFailureState extends AdminState {
  final String error;

  SetAnimeDataFailureState(this.error);

}
