class Event {
  final int id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String? image;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      date: DateTime.parse(json['date'] as String),
      image: json['image'] as String?,
    );
  }
}
