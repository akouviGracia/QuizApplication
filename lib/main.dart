import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiztg/login.dart';
// NOTE: Les imports de chemins de fichiers locaux ('package:quiztg/...') ont été supprimés
// car toutes les classes sont incluses ici pour rendre le fichier autonome et fonctionnel.

// ----------------------------------------------------
// STUBS (Classes Simulees pour rendre le code runnable)
// ----------------------------------------------------

// Simulacre des classes de Provider
class PhaseProvider extends ChangeNotifier {}
class AuthProvider extends ChangeNotifier {}

// Simulacre de la page de Connexion
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text(
          "Formulaire de Connexion ici.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// WIDGETS PRINCIPAUX
// ----------------------------------------------------

// Le widget racine qui fournit le MaterialApp
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Le MaterialApp doit être au-dessus du SplashPage pour fournir la Directionality.
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Quiz',
      // Le point de départ réel de l'application après le MultiProvider
      home: SplashPage(),
    );
  }
}


void main() {
  // Le point d'entrée de l'application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PhaseProvider()
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider()
        )
      ],
      // Le MultiProvider doit appeler un widget qui contient le MaterialApp
      child: const QuizApp(),
    )
  );
}


// PAGE SPLASH
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan, // <--- COULEUR CYAN
      body: Center( // Utiliser Center pour centrer la colonne
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Quiz
            // NOTE: L'image "assets/images/quiz.jpg" doit être configurée dans votre pubspec.yaml
            Image.asset(
              "assets/images/quiz.jpg",
              width: 200,
              // Affiche un texte si l'image n'est pas trouvée
              errorBuilder: (context, error, stackTrace) => Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  'Logo Quiz', 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Bouton Continuer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                ),
                onPressed: () {
                  // 🚀 Logique pour passer à la page de connexion
                  Navigator.push(
                    context,
                    // Utiliser 'const' sur LoginPage() si LoginPage est StatelessWidget et n'a pas de champs mutables
                    MaterialPageRoute(builder: (context) => const BrainGameApp()), 
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
      ),
    );
  }
}
