import 'package:animetv/features/homepage/screens/homepage.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';




@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(
    path: '',page:HomePage
  )
])
class $AppRouter {}