

import 'package:flutter/material.dart';
import 'package:quiztg/Phase.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  // Données de statistiques simulées
  // J'ai mis à jour la structure pour inclure les Phases et les catégories, 
  // en assurant que toutes les valeurs sont affichables.
  static final Map<String, dynamic> mockStats = {
    "Phase 1": 00, // Score en %
    'Phase 2': 00, // Score en %
    'Phase 3': 00, // Score en %
    'timeTaken': 000, // Temps pris en secondes (simulé)
    'categories': [
      {'name': 'Phase 1: Débutant - Algorithmique', 'correct': 00, 'total': 00},
      {'name': 'Phase 2: Intermédiaire - Programmation procédurale', 'correct': 00, 'total': 00},
      {'name': 'Phase 3: Avancé - POO', 'correct': 00, 'total': 00},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Fond légèrement gris pour le contraste
      appBar: AppBar(
        title: const Text("Statistiques du Quiz"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Résumé Principal (Scores par Phases et Temps)
            _buildSummaryCard(),
            const SizedBox(height: 20),

            // Section 2: Titre de la performance par Catégorie
            const Text(
              "Performance par Catégorie",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: Colors.blueGrey
              ),
            ),
            const SizedBox(height: 10),

            // Section 3: Liste des Performances par Catégorie
            ...mockStats['categories'].map<Widget>((category) {
              return _buildCategoryTile(category);
            }).toList(),

            const SizedBox(height: 30),
            // Bouton de retour ou d'action
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text("Commencer un quiz"),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhaseScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour la carte de résumé des statistiques principales (mis à jour)
  Widget _buildSummaryCard() {
    // Conversion du temps total en format lisible (Minutes:Secondes)
    final int timeInSeconds = mockStats['timeTaken'];
    final int minutes = timeInSeconds ~/ 60;
    final int seconds = timeInSeconds % 60;
    final String timeFormatted = "${minutes}m ${seconds}s";

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Affichage des scores par Phase
            _buildStatItem(
              label: "Phase 1",
              value: "${mockStats['Phase 1']}%",
              color: Colors.cyan,
              icon: Icons.looks_one_outlined,
            ),
            _buildDivider(),
            _buildStatItem(
              label: "Phase 2",
              value: "${mockStats['Phase 2']}%",
              color: Colors.cyan.shade700,
              icon: Icons.looks_two_outlined,
            ),
            _buildDivider(),
            _buildStatItem(
              label: "Phase 3",
              value: "${mockStats['Phase 3']}%",
              color: Colors.cyan.shade900,
              icon: Icons.looks_3_outlined,
            ),
            _buildDivider(),
            // Affichage du temps total
            _buildStatItem(
              label: "Temps Écoulé Total",
              value: timeFormatted,
              color: Colors.orange,
              icon: Icons.timer_outlined,
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour un élément de statistique individuel (Score, Temps...)
  // Cette fonction était déjà correcte.
  Widget _buildStatItem({required String label, required String value, required Color color, required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  // Widget pour une tuile de performance par catégorie
  // Cette fonction était déjà correcte.
  Widget _buildCategoryTile(Map<String, dynamic> category) {
    // S'assurer que 'correct' et 'total' sont des nombres pour le calcul
    final int correct = category['correct'] as int;
    final int total = category['total'] as int;
    final double percentage = total > 0 ? correct / total : 0.0;
    
    // Déterminer la couleur en fonction du pourcentage
    final Color progressColor = percentage > 0.75 ? Colors.green : percentage > 0.5 ? Colors.orange : Colors.red;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category['name'],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${category['correct']}/${category['total']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: progressColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Barre de progression
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: progressColor,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
  
  // Séparateur
  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(height: 1, thickness: 0.5),
    );
  }
}
