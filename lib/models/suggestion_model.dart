class Suggestion {
  final String placeId;
  final String description;

  Suggestion({
    required this.placeId,
    required this.description,
  });

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}
