class Vacancy {
  final String? id;
  final String? title;
  final String? company;
  final String? location;
  final String? description;
  final String? longDescription;
  final String? salary;
  final String? datePosted;
  final String? imageUrl;

  Vacancy({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.longDescription,
    required this.salary,
    required this.datePosted,
    required this.imageUrl,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      description: json['description'],
      longDescription: json['long_description'],
      salary: json['salary'],
      datePosted: json['date_posted'],
      imageUrl: json['image_url'],
    );
  }
}
