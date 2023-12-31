import 'package:fitness_tracker/pages/auth_screen.dart';
import 'package:fitness_tracker/pages/home_screen.dart';
import 'package:fitness_tracker/pages/login_screen.dart';
import 'package:fitness_tracker/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitTracker',
      initialRoute: '/auth',
      routes: {
        '/login':(context) => LoginScreen(),
        '/register':(context) => RegisterScreen(),
        '/home':(context) => HomeScreen(),
        '/auth':(context) => AuthScreen()
      },
    );
  }
}

