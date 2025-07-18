class Team {
  final int id;
  final String name;

  Team({required this.id, required this.name});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
