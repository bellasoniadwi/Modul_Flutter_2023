import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/pages/crud_page.dart';
import 'package:flutterfirebase/pages/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //Show a loading indicator while checking the authentication state
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              //User is logged in, navigate to the home page
              return const CrudPage();
            } else {
              //User is not logged in, navigate to the login page
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
