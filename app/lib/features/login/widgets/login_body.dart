import 'dart:convert';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.width,
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
  });
  final double width;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          loginEmail(),
          loginPassword(),
          loginEnter(context),
          Expanded(
            child: Container(
              width: width,
            ),
          ),
          loginCreateAccaunt()
        ]
      ),
    );
  }

  SizedBox loginCreateAccaunt() {
    return SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: <Widget>[
                const Text("Don't have an account?"),
                MaterialButton(
                  onPressed: () => {
                    //похуй
                  },
                  child: const Text("Sign up"),
                )
              ],
            ),
          ),
        );
  }

  SizedBox loginEnter(BuildContext context) {
    return SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: MaterialButton(
              onPressed: onLoginPressed,
              child: const Text("Login"),
            ),
          ),
        );
  }

  SizedBox loginPassword() {
    return SizedBox(
          width: width,
          child: TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
        );
  }

  SizedBox loginEmail() {
   return SizedBox(
      width: width,
      child: Padding (
        padding: const EdgeInsets.only(top: 100),
        child: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: "Email"),
        ),
      ),
    );
  }
}
