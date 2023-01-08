import 'package:animetv/core/blocobserver/bloc_observer.dart';
import 'package:animetv/core/dependencyInjection/di.dart';
import 'package:animetv/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';
import 'features/adminpanel/presentation/bloc/admin_bloc.dart';
import 'features/homepage/presentation/bloc/anime_bloc.dart';
import 'firebase_options.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  await dotenv.load(fileName: ".env");
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("0259a4f7-487d-4eaf-9712-eaacb58c3f2e");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBsa4zYWyoDxZnR1kVbaDrh3WExKptACuI",
            authDomain: "animetv-1ae1e.firebaseapp.com",
            projectId: "animetv-1ae1e",
            storageBucket: "animetv-1ae1e.appspot.com",
            messagingSenderId: "972027550217",
            appId: "1:972027550217:web:a391e4165b6cc3c43db6d8"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  await AppContainer.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
        routerDelegate: AutoRouterDelegate(_appRouter,
            initialRoutes: [const SplashScreenRoute()]),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
