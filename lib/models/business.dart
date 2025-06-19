class Business {
  final int id;
  final String name;
  final String description;
  final List<String> tags;
  final String hours;
  final String contact;
  final String website;
  final String mapLink;

  Business({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.hours,
    required this.contact,
    required this.website,
    required this.mapLink,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
      hours: json['hours'] as String,
      contact: json['contact'] as String,
      website: json['website'] as String,
      mapLink: json['mapLink'] as String,
    );
  }
}
