import 'package:animetv/core/images/app_images.dart';
import 'package:animetv/core/modules/firebasemodules.dart';
import 'package:animetv/core/routes/router.gr.dart';
import 'package:animetv/features/auth/presentation/screens/auth_validation_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomePage();
  }

  void goToHomePage() {
    Future.delayed(Duration(seconds: 0), () {
      context.router.replaceAll([AuthValidationRoute(auth: GetIt.I<FirebaseAuth>())]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.splashImage),
          LoadingAnimationWidget.twistingDots(
            leftDotColor: Color.fromARGB(255, 255, 255, 255),
            rightDotColor: const Color(0xFFEA3799),
            size: 50,
          ),
        ],
      )),
    );
  }
}
