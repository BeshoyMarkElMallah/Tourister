class PlaceModel {
  final String img;
  final String title;
  final String description;
  final String location;
  final String distance;
  final bool isFav;

  const PlaceModel(
      {required this.img,
      required this.title,
      required this.description,
      required this.location,
      required this.distance,
      required this.isFav});
}
