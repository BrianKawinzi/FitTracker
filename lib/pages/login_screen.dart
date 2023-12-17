import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/components/normal_tf.dart';
import 'package:fitness_tracker/components/password_tf.dart';
import 'package:fitness_tracker/components/square_tile.dart';
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

  void wrongEmailMessage() {
      showDialog(
        context: context, 
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        },
      );
    }

    void wrongPasswordMessage() {
      showDialog(
        context: context, 
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        },
      );
    }

  //sign user in method
  void signUserIn() async {

    //sign in functionality
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );

      //Navigate to home screen 
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
     
      if (e.code == 'user-not-found') {
        //show error to user
        wrongEmailMessage();
      }
      else if (e.code == 'wrong-password') {

        wrongPasswordMessage();
      }

      
    }

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //welcome back you've been missed
                Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                //email textfield
                normalTF(
                  controller: emailController, 
                  hintText: 'Enter your email', 
                  obscureText: false
                ),

                const SizedBox(height: 10),

                //password textfield
                PasswordTf(
                  controller: passwordController, 
                  hintText: 'Enter your Password'
                ),

                 const SizedBox(height: 25),

                //login button
                MyButton(
                  onTap: signUserIn, 
                  buttonText: "Login"
                ),

                const SizedBox(height: 50),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                //google or apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    //google button
                    SquareTile(imagepath: 'lib/assets/google.png'),

                    SizedBox(width: 25),

                    //apple button
                    SquareTile(imagepath: 'lib/assets/apple.png'),

                  ],
                ),

                const SizedBox(height: 10),


                //not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    const SizedBox(width: 2),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      }, 
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}