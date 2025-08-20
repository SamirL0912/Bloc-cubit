class EuropaModel {
  final int year;
  final String team;

  EuropaModel({
    required this.year,
    required this.team,
  });

  factory EuropaModel.fromJson(Map<String, dynamic> json) {
    return EuropaModel(
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
