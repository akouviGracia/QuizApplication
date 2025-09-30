import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ⚠️ ASSUMPTION 1: Define minimal required classes for a runnable example.
// Vous devez les adapter à votre structure réelle.

// --- Structure de Données : Phase ---
class Phase {
  final String id;
  final String title;
  final String description;
  Phase({required this.id, required this.title, required this.description});
}

// --- Écran de Destination : QuestionScreen ---
// Ceci est une version minimale pour éviter une erreur de compilation.
class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: Vous devriez probablement recevoir l'objet Phase ici pour savoir quel quiz charger.
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: const Center(child: Text('Démarrage du Quiz...')),
    );
  }
}

// --- Gestionnaire d'État : PhaseProvider ---
// Ceci est une version minimale pour éviter une erreur de compilation.
// Elle simule le chargement de données.
class PhaseProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Phase> _phases = [];

  bool get isLoading => _isLoading;
  List<Phase> get phases => _phases;

  PhaseProvider() {
    // Simuler un chargement de données initial
    _loadPhases();
  }

  void _loadPhases() async {
    // Simuler un délai réseau
    await Future.delayed(const Duration(seconds: 2));
    _phases = [
      Phase(id: '1', title: 'Phase 1 : Les Bases', description: 'Questions faciles pour commencer.'),
      Phase(id: '2', title: 'Phase 2 : Intermédiaire', description: 'Un peu plus de challenge.'),
      Phase(id: '3', title: 'Phase 3 : Avancée', description: 'Mettez vos connaissances à l\'épreuve.'),
      Phase(id: '4', title: 'Phase 4 : Expert', description: 'Le défi ultime.'),
    ];
    _isLoading = false;
    notifyListeners();
  }
}
// ⚠️ ASSUMPTION 1 END ----------------------------------------------------------------

class PhaseScreen extends StatefulWidget {
  const PhaseScreen({super.key});

  @override
  State<PhaseScreen> createState() => _PhaseScreenState();
} 

class _PhaseScreenState extends State<PhaseScreen> {
  
  // Utilisation de la méthode initState pour appeler la fonction de chargement
  // si nécessaire, bien que le Provider le fasse déjà dans l'exemple minimal.
  @override
  void initState() {
    super.initState();
    // Ex: Si le chargement n'est pas fait dans le constructeur du Provider, on pourrait le faire ici :
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<PhaseProvider>(context, listen: false).loadPhases();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sélection des Phases de Quiz"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<PhaseProvider>(
        builder: (context, provider, child) {
          // 1. Affichage du chargement (si en cours)
          if (provider.isLoading && provider.phases.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.cyan),
                  SizedBox(height: 15),
                  Text("Chargement des phases...")
                ],
              ),
            );
          } 
          
          // 2. Affichage si aucune phase n'est trouvée (après le chargement)
          else if (provider.phases.isEmpty && !provider.isLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  "Aucune phase disponible pour le moment.\nVeuillez réessayer plus tard.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                ),
              ),
            );
          } 
          
          // 3. Affichage de la liste des phases
          else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: provider.phases.length,
              itemBuilder: (context, index) {
                final phase = provider.phases[index];

                // Fonction pour obtenir l'icône basée sur l'index (jusqu'à 9)
                IconData _getPhaseIcon(int index) {
                  switch (index) {
                    case 0: return Icons.looks_one_outlined;
                    case 1: return Icons.looks_two_outlined;
                    case 2: return Icons.looks_3_outlined;
                    case 3: return Icons.looks_4_outlined;
                    case 4: return Icons.looks_5_outlined;
                    case 5: return Icons.looks_6_outlined;
                    // ... ajouter plus de cas si nécessaire.
                    default: return Icons.lightbulb_outline; // Icône par défaut
                  }
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      leading: Icon(
                        _getPhaseIcon(index), // Utilise la fonction pour une meilleure évolutivité
                        color: Colors.cyan.shade600, 
                        size: 30
                      ),
                      title: Text(
                        phase.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        phase.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueGrey),
                      onTap: () {
                        // 🚀 Naviguer vers la QuestionScreen en passant la phase sélectionnée
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // ⚠️ Il est crucial de passer l'objet phase à l'écran de question !
                            builder: (context) => QuestionScreen(), // Vous devriez passer `phase` en argument ici
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}