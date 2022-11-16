// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:animetv/features/auth/presentation/screens/auth_validation_screen.dart'
    as _i5;
import 'package:animetv/features/auth/presentation/screens/login_screen.dart'
    as _i2;
import 'package:animetv/features/auth/presentation/screens/signup_screen.dart'
    as _i3;
import 'package:animetv/features/homepage/presentation/screens/homepage.dart'
    as _i4;
import 'package:animetv/features/adminpanel/presentation/screens/uploadAnimePage.dart'
    as _i6;
import 'package:animetv/features/splashScreen/splash_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(
          key: args.key,
          auth: args.auth,
        ),
      );
    },
    AuthValidationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthValidationRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.AuthValidation(
          key: args.key,
          auth: args.auth,
        ),
      );
    },
    UploadAnimePageqRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.UploadAnimePageq(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          SplashScreenRoute.name,
          path: '',
        ),
        _i7.RouteConfig(
          LoginScreenRoute.name,
          path: 'login',
        ),
        _i7.RouteConfig(
          SignUpRoute.name,
          path: 'signup',
        ),
        _i7.RouteConfig(
          HomePageRoute.name,
          path: 'home',
        ),
        _i7.RouteConfig(
          AuthValidationRoute.name,
          path: 'authValidation',
        ),
        _i7.RouteConfig(
          UploadAnimePageqRoute.name,
          path: 'uploadAnime',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.SignUp]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i8.Key? key,
    required _i9.FirebaseAuth auth,
  }) : super(
          HomePageRoute.name,
          path: 'home',
          args: HomePageRouteArgs(
            key: key,
            auth: auth,
          ),
        );

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({
    this.key,
    required this.auth,
  });

  final _i8.Key? key;

  final _i9.FirebaseAuth auth;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key, auth: $auth}';
  }
}

/// generated route for
/// [_i5.AuthValidation]
class AuthValidationRoute extends _i7.PageRouteInfo<AuthValidationRouteArgs> {
  AuthValidationRoute({
    _i8.Key? key,
    required _i9.FirebaseAuth auth,
  }) : super(
          AuthValidationRoute.name,
          path: 'authValidation',
          args: AuthValidationRouteArgs(
            key: key,
            auth: auth,
          ),
        );

  static const String name = 'AuthValidationRoute';
}

class AuthValidationRouteArgs {
  const AuthValidationRouteArgs({
    this.key,
    required this.auth,
  });

  final _i8.Key? key;

  final _i9.FirebaseAuth auth;

  @override
  String toString() {
    return 'AuthValidationRouteArgs{key: $key, auth: $auth}';
  }
}

/// generated route for
/// [_i6.UploadAnimePageq]
class UploadAnimePageqRoute extends _i7.PageRouteInfo<void> {
  const UploadAnimePageqRoute()
      : super(
          UploadAnimePageqRoute.name,
          path: 'uploadAnime',
        );

  static const String name = 'UploadAnimePageqRoute';
}
