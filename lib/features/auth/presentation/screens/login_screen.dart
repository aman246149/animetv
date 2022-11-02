import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/core/routes/router.gr.dart';
import 'package:animetv/core/utils/common_methods.dart';
import 'package:animetv/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/button_widget.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void validateData() {
    // Validate returns true if the form is valid, or false otherwise.
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context
        .read<AuthBloc>()
        .add(AuthSignInEvent(email.text.trim(), password.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignInLoadingState) {
              setState(() {
                showOverlayLoader(context);
              });
            } else if (state is AuthSignInSuccessFullState) {
              setState(() {
                hideOverlayLoader(context);
                context.router.replaceAll([HomePageRoute(auth: GetIt.I<FirebaseAuth>())]);
              });
            } else if (state is AuthSignInFailureState) {
              setState(() {
                hideOverlayLoader(context);
                showErrorSnackbar(context, state.message);
              });
            }
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Vspace(20),
                  Text(
                    "Lets sign you in.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 30),
                  ),
                  const Vspace(10),
                  Text(
                    "Welcome back..",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1),
                  ),
                  const Vspace(10),
                  Text(
                    "You've been missed!",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1),
                  ),
                  const Vspace(80),
                  TextInputField(
                    controller: email,
                    text: "Email address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter correct email';
                      }
                      return null;
                    },
                  ),
                  const Vspace(20),
                  TextInputField(
                    controller: password,
                    text: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter correct password';
                      }
                      return null;
                    },
                  ),
                  const Expanded(child: Vspace(0)),
                  GestureDetector(
                    onTap: () {
                      context.router.popAndPush(const SignUpRoute());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?  ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CommonButtonWidget(
          ontap: validateData,
          text: "Sign In",
        ),
      ),
    );
  }
}
