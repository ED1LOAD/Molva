class Vacancy {
  final int id;
  final String title;
  final String company;
  final String date;
  final String description;
  final String picture;
  final int cost;
  final bool hasResponses;

  Vacancy({
    required this.id,
    required this.title,
    required this.company,
    required this.date,
    required this.description,
    required this.picture,
    required this.cost,
    this.hasResponses = false,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      id: json['id'] as int,
      title: json['title'] as String,
      company: json['company'] as String,
      date: json['date'] as String,
      description: json['requirements'] as String,
      picture: json['logo'] as String,
      cost: json['cost'] as int,
      hasResponses: json['has_responses'] as bool,
    );
  }
}
