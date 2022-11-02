// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/adminpanel/data/admin_repository.dart' as _i7;
import '../../features/adminpanel/domain/adminusecase.dart' as _i8;
import '../../features/adminpanel/presentation/bloc/admin_bloc.dart' as _i13;
import '../../features/auth/data/auth_repository.dart' as _i11;
import '../../features/auth/domain/usecase/auth_usecase.dart' as _i12;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i15;
import '../../features/homepage/data/repository/anime_repository.dart' as _i9;
import '../../features/homepage/domain/animeusecase.dart' as _i10;
import '../../features/homepage/presentation/bloc/anime_bloc.dart' as _i14;
import '../blocobserver/bloc_observer.dart' as _i3;
import '../modules/firebasemodules.dart' as _i16;
import '../utils/loader.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final firebaseAuthIns = _$FirebaseAuthIns();
  final firebaseDb = _$FirebaseDb();
  gh.lazySingleton<_i3.AppBlocObserver>(() => _i3.AppBlocObserver());
  gh.lazySingleton<_i4.FirebaseAuth>(() => firebaseAuthIns.auth);
  gh.lazySingleton<_i5.FirebaseFirestore>(() => firebaseDb.firebasefiresore);
  gh.lazySingleton<_i6.Loader>(() => _i6.Loader());
  gh.lazySingleton<_i7.AdminRepository>(
      () => _i7.AdminRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i8.AdminUsecase>(
      () => _i8.AdminUsecase(get<_i7.AdminRepository>()));
  gh.lazySingleton<_i9.AnimeRepository>(() => _i9.AnimeRepository(
        get<_i4.FirebaseAuth>(),
        get<_i5.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i10.AnimeUsecase>(
      () => _i10.AnimeUsecase(get<_i9.AnimeRepository>()));
  gh.lazySingleton<_i11.AuthRepository>(() => _i11.AuthRepository(
        get<_i5.FirebaseFirestore>(),
        get<_i4.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i12.AuthUsecase>(
      () => _i12.AuthUsecase(get<_i11.AuthRepository>()));
  gh.lazySingleton<_i13.AdminBloc>(
      () => _i13.AdminBloc(get<_i8.AdminUsecase>()));
  gh.lazySingleton<_i14.AnimeBloc>(
      () => _i14.AnimeBloc(get<_i10.AnimeUsecase>()));
  gh.lazySingleton<_i15.AuthBloc>(() => _i15.AuthBloc(get<_i12.AuthUsecase>()));
  return get;
}

class _$FirebaseAuthIns extends _i16.FirebaseAuthIns {}

class _$FirebaseDb extends _i16.FirebaseDb {}
