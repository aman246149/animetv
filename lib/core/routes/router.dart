
import 'package:animetv/features/auth/presentation/screens/auth_validation_screen.dart';
import 'package:animetv/features/adminpanel/presentation/screens/uploadAnimePage.dart';
import 'package:animetv/features/splashScreen/splash_screen.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/homepage/presentation/screens/homepage.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
  AutoRoute(path: 'login', page: LoginScreen),
  AutoRoute(path: 'signup', page: SignUp),
  AutoRoute(path: 'home', page: HomePage),
  AutoRoute(path: 'authValidation', page: AuthValidation),
  AutoRoute(path: 'uploadAnime', page: UploadAnimePageq),
])
class $AppRouter {}
