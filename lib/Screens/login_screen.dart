import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            loginAction();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                ),
                child: Image.asset(
                  'assets/sticker.png',
                ),
              ),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[400],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/auth0.png',
                      width: 120,
                      height: 50,
                    ),
                    Text(
                      'Login with Auth0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(loginError ?? ''),
      ],
    );
  }
}