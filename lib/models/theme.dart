class ThemeModel {
  final String phaseId;
  final String titre;
  final String description;

  ThemeModel({
    required this.phaseId,
    required this.titre,
    required this.description,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      phaseId: json['phaseId'],
      titre: json['titre'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phaseId': phaseId,
      'titre': titre,
      'description': description,
    };
  }
}
    

  
  
