class QuestionModel {
  int? themeId;
   String texte;
  String type;
  int points;

  QuestionModel({
    this.themeId,
    required this.texte,
    required this.type,
    required this.points,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      themeId: json['theme_id'],
      texte: json['texte'],
      type: json['type'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme_id': themeId,
      'texte': texte,
      'type': type,
      'points': points,
    };

  }

  String getFormattedQuestion() {
    return 'Question: $texte (Type: $type, Points: $points)';
  }

  String getQuestionSummary() {
    return '$texte - $points points';
  }


}