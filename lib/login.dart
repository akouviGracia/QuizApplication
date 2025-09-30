import 'package:flutter/material.dart';
import 'package:quiztg/SignUpPage.dart';
    
void main() {
  runApp(const BrainGameApp());
}

class BrainGameApp extends StatelessWidget {
  const BrainGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainGame',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Roboto', 
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// --------------------------------------------------
/// La page de connexion, convertie en StatefulWidget pour gérer les contrôleurs de texte
/// et implémenter la logique de redirection.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;
  int loginState = 0;
  final TextEditingController _emailController = TextEditingController();



  final List<String> _registeredEmails = ['admin@example.com', ];

  @override
  void dispose() {
    _emailController.dispose();
    
    super.dispose();
  }

  
  void _handleLogin() {
    final String enteredEmail = _emailController.text.trim().toLowerCase();
    
    if (enteredEmail.isEmpty) {
      
      print("Erreur : L'email est vide.");
      // Vous pouvez utiliser un SnackBar pour l'affichage ici.
      return; 
    }

    // 1. SIMULATION de la VÉRIFICATION D'INSCRIPTION (remplace l'appel API)
    if (_registeredEmails.contains(enteredEmail)) {
      // L'utilisateur est déjà inscrit -> Tente la connexion normale
      print("Action : L'email ($enteredEmail) est déjà inscrit. Tentative de connexion...");
      
      
    } else {
      
      print("Action : L'email ($enteredEmail) n'est pas inscrit. Redirection vers l'inscription...");
      
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customCyan = Color(0xFF2591C3);
    const TextStyle titleStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Pacifico',
    );
    const TextStyle linkStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    const TextStyle labelStyle = TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // --- 1. Top Section: Bienvenue ---
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35, 
              color: Colors.cyan,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 50.0),
              child: const Text(
                "Bienvenue Sur BrainGame",
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
            ),

            // --- 2. Middle Section: Formulaire de Connexion ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30.0),
              color: Colors.white, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Titre Connexion
                  const Text(
                    "Connexion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Pacifico', 
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Champ Email
                  const Text("Email", style: labelStyle),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Entrez votre email',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: customCyan,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  
                  const SizedBox(height: 20), 

                  
                  

                  const SizedBox(height: 40),

                  // Bouton "Se connecter"
                  ElevatedButton(
                    onPressed: _handleLogin, // **Appelle la fonction avec la nouvelle logique**
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60), 
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- 3. Bottom Section: Inscription (Lien de Redirection Secondaire) ---
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30, 
              color: customCyan,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}