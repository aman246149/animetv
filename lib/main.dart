import 'package:animetv/core/blocobserver/bloc_observer.dart';
import 'package:animetv/core/dependencyInjection/di.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsFlutterBinding.ensureInitialized();
  await AppContainer.init();

  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: GetIt.I<AppBlocObserver>());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: AutoRouterDelegate(
        _appRouter,
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
