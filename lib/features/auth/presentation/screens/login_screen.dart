import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Vspace(20),
              Text(
                "Lets sign you in.",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, fontSize: 30),
              ),
              Vspace(10),
              Text(
                "Welcome back..",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1),
              ),
              Vspace(10),
              Text(
                "You've been missed!",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1),
              ),
              Vspace(80),
              TextInputField(
                controller: email,
                text: "Email address",
              ),
              Vspace(20),
              TextInputField(
                controller: password,
                text: "Password",
              ),
              Expanded(child: Vspace(0)),
              GestureDetector(
                onTap: () {
                  context.router.popAndPush(SignUpRoute());
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
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CommonButtonWidget(
          ontap: () {},
          text: "Sign In",
        ),
      ),
    );
  }
}

