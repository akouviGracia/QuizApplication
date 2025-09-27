class PhaseModel {
  final String id;
  final String titre;
  final String description;

  PhaseModel({
    required this.id,
    required this.titre,
    required this.description,
  });

  factory PhaseModel.fromJson(Map<String, dynamic> json) {
    return PhaseModel(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
    };
  }

  String getPhaseSummary() {
    return '$titre: $description';
  }

  String getDetailedInfo() {
    return 'Phase ID: $id\nTitle: $titre\nDescription: $description';
  }

  String getPhaseDetails() {
    return '[$id] $titre - $description';
  }

  
}