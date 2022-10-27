import 'package:animetv/features/homepage/screens/homepage.dart';
import 'package:animetv/features/splashScreen/splash_screen.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
  AutoRoute(
    path: 'home',
    page: HomePage,
  )
])
class $AppRouter {}
