class League {
  final String id;
  final String name;
  final String country;

  League({
    required this.id,
    required this.name,
    required this.country,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
      country: json['country'],
    );
  }
}