import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:heroig/services/auth_services.dart';

class Masuk extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthServices>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        },
                        child: Text("Sign in"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text('Atau Login Menggunakan Google'),
              ),
              Container(
                child: SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () {
                    context.read<AuthServices>().signInWithGoogle();
                  },
                  text: 'Masuk',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
