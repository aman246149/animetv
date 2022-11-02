import 'package:animetv/features/auth/presentation/screens/login_screen.dart';
import 'package:animetv/features/homepage/presentation/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/modules/firebasemodules.dart';

class AuthValidation extends StatelessWidget {
  final FirebaseAuth auth;
  const AuthValidation({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePage(auth: GetIt.I<FirebaseAuth>(),);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
        }

        return const LoginScreen();
      },
    );
  }
}
