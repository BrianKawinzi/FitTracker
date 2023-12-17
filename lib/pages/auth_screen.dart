import 'package:fitness_tracker/pages/home_screen.dart';
import 'package:fitness_tracker/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
