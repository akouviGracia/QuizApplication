import 'package:flutter/material.dart';
import 'package:quiztg/Statistics.dart';

// --------------------------------------------------

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void _handleSignUpSubmit(BuildContext context) {
    print("Action : Tentative d'inscription et redirection après succès...");
    
  }

  void _handleLoginRedirect(BuildContext context) {
    print("Action : Redirection vers la page de connexion...");
  }

  @override
  Widget build(BuildContext context) {
    const Color cyan = Color(0xFF2591C3); // La couleur bleue dominante

    // Les styles de texte pour l'esthétique
    const TextStyle titleStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Pacifico', 
    );

    const TextStyle formTitleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Pacifico',
    );
    
    // Style de texte pour le bouton S'inscrire
    const TextStyle signUpButtonStyle = TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Pacifico',
    );

    return Scaffold(
      resizeToAvoidBottomInset: true, 
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // --- 1. Top Section: Bienvenue ---
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25, 
              color: cyan,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 50.0),
              child: const Text("Bienvenue Sur BrainGame", textAlign: TextAlign.center, style: titleStyle),
            ),

            // --- 2. Middle Section: Formulaire d'Inscription ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30.0),
              color: Colors.white, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Titre Inscription
                  const Text("Inscription", textAlign: TextAlign.center, style: formTitleStyle),
                  const SizedBox(height: 30),

                  // Champ Nom
                  const Text("Nom", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  _buildInputField(primaryColor: cyan, hintText: 'Entrez votre nom'),
                  const SizedBox(height: 30),

                  // Champ Email
                  const Text("Email", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  _buildInputField(primaryColor: cyan, hintText: 'Entrez votre email', keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 30),

                  
                  //  BOUTON "S'INSCRIRE" (REDIRECTION/SOUMISSION) 
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatisticsPage()),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      backgroundColor: cyan,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text("S'inscrire", style: signUpButtonStyle),
                  ),
                ],
              ),
            ),

            // --- 3. Bottom Section: Lien de Connexion (Redirection secondaire) ---
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              color: cyan,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => _handleLoginRedirect(context), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Déjà un compte?", style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text(
                      "Se Connecter", 
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget utilitaire pour construire les champs de texte
Widget _buildInputField({
  required Color primaryColor,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool isPassword = false,
}) {
  return Container(
    height: 50,
    color: primaryColor, 
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white70),
          ),
          keyboardType: keyboardType,
        ),
      ),
    ),
  );
}