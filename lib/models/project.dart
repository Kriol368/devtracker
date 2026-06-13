class Project {
  final String id;
  final String name;
  final String description;
  final String longDescription;
  final List<String> technologies;
  final DateTime date;
  final String category;
  final String githubUrl;
  final bool featured;
  bool favorite;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.longDescription,
    required this.technologies,
    required this.date,
    required this.category,
    required this.githubUrl,
    this.featured = false,
    this.favorite = false,
  });
}