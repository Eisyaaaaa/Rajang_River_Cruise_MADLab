class CruiseDestination {
  final String title;
  final String location;
  final String description;
  final String imagePath;
  int starCount;

  CruiseDestination({
    required this.title,
    required this.location,
    required this.description,
    required this.imagePath,
    this.starCount = 41,
  });
}