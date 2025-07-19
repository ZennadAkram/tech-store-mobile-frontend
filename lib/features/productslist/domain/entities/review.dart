class Review {
  final int id;
  final int user;
  final int rating;
  final String review;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.user,
    required this.rating,
    required this.review,
    required this.createdAt,
  });
}
