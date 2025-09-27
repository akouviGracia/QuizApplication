import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiztg/auth/LoginPage.dart';
import 'package:quiztg/providers/auth.dart';
import 'package:quiztg/providers/phase.dart';

void main() {
  runApp(MultiProvider(
    providers:
     [ChangeNotifierProvider(
      create: (_) => PhaseProvider()
      ),
      ChangeNotifierProvider(
      create: (_) => AuthProvider()
      )
      ],
      child: SplashPage(),
    ));
}

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }

// PAGE SPLASH
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Quiz
          Image.asset(
            "assets/images/quiz.jpg",
            width: 200,
          ),
          const SizedBox(height: 30),

          // Image cerveau
          // Image.asset(
          //   "assets/images/brain.png",
          //   width: 120,
          // ),
          // const SizedBox(height: 50),

          // Bouton Continuer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              },
              child: const Text(
                "Continuer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


