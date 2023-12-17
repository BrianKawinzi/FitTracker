import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {

    //sign in functionality
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //show error to user
      }

      
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}