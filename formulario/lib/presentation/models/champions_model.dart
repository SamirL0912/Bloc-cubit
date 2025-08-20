class ChampionsModel {
  final int year;
  final String team;

  ChampionsModel({
    required this.year,
    required this.team,
  });

  factory ChampionsModel.fromJson(Map<String, dynamic> json) {
    return ChampionsModel(
      year: json['year'],
      team: json['team'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'team': team,
    };
  }
}
