class Match {
  final String id;
  final String homeTeam;
  final String awayTeam;
  final DateTime matchTime;
  final String leagueId;

  Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchTime,
    required this.leagueId,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      homeTeam: json['homeTeam'],
      awayTeam: json['awayTeam'],
      matchTime: DateTime.parse(json['matchTime']),
      leagueId: json['leagueId'],
    );
  }
}