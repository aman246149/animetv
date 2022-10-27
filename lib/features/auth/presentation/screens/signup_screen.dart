import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/features/auth/presentation/widgets/textfield.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/router.gr.dart';
import '../widgets/button_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              ),
              Vspace(20),
              TextInputField(
                controller: password,
                text: "Password",
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
          text: "Sign Up",
        ),
      ),
    );
  }
}
