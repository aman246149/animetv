import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:animetv/features/auth/presentation/widgets/textfield.dart';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/routes/router.gr.dart';
import '../../../../core/utils/common_methods.dart';
import '../widgets/button_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        .add(AuthSignUpEvent(email.text.trim(), password.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSignUpLoadingState) {
                setState(() {
                  showOverlayLoader(context);
                });
              } else if (state is AuthSignUpSuccessFullState) {
                setState(() {
                  hideOverlayLoader(context);
                  context.router.replaceAll(
                      [HomePageRoute(auth: GetIt.I<FirebaseAuth>())]);
                });
              } else if (state is AuthSignUpFailureState) {
                setState(() {
                  hideOverlayLoader(context);
                  showErrorSnackbar(context, state.message);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Vspace(20),
                  Text(
                    "Lets sign up .",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 30),
                  ),
                  Vspace(10),
                  Text(
                    "Welcome.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1),
                  ),
                  Vspace(10),
                  Vspace(80),
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
                  Vspace(20),
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
                  Expanded(child: Vspace(0)),
                  GestureDetector(
                    onTap: () {
                      context.router.popAndPush(LoginScreenRoute());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          "Login",
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
          text: "Sign Up",
        ),
      ),
    );
  }
}
