class Prediction {
  final String matchId;
  final String predictedScore;
  final String confidence;
  final Map<String, dynamic> statistics;

  Prediction({
    required this.matchId,
    required this.predictedScore,
    required this.confidence,
    required this.statistics,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      matchId: json['matchId'],
      predictedScore: json['predictedScore'],
      confidence: json['confidence'],
      statistics: json['statistics'],
    );
  }
}