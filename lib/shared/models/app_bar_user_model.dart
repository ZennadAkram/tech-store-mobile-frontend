class AppBarUserModel {
  final String email;
  final int id;
  final String? image;
  final String userName;

  AppBarUserModel({
    required this.email,
    required this.id,
    this.image,
    required this.userName,
  });

  // Add empty factory constructor
  factory AppBarUserModel.empty() {
    return AppBarUserModel(
      email: '',
      id: -1,
      image: null,
      userName: '',
    );
  }

  factory AppBarUserModel.fromJson(Map<String, dynamic> json) => AppBarUserModel(
    email: json["email"],
    id: json["id"],
    image: json["image"],
    userName: json["username"],
  );

  // Helper method to check if this is an empty model
  bool get isEmpty => id == -1;
}