import 'package:animetv/core/blocobserver/bloc_observer.dart';
import 'package:animetv/core/dependencyInjection/di.dart';
import 'package:animetv/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';
import 'features/adminpanel/presentation/bloc/admin_bloc.dart';
import 'features/homepage/presentation/bloc/anime_bloc.dart';
import 'firebase_options.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppContainer.init();
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: GetIt.I<AppBlocObserver>());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: GetIt.I<AuthBloc>()),
        BlocProvider.value(value: GetIt.I<AnimeBloc>()),
        BlocProvider.value(value: GetIt.I<AdminBloc>())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerDelegate:
            AutoRouterDelegate(_appRouter, initialRoutes: [SplashScreenRoute()]),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
