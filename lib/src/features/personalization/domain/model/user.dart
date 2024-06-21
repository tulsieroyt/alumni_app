class User {
  final String name;
  final String imageUrl;

  User({
    required this.name,
    required this.imageUrl,
  });

  //fromJson Constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], imageUrl: json['imageUrl']);
  }

  //toJson Constructor
  Map<String, dynamic> toJson() {
    return {'name': name, 'imageUrl': imageUrl};
  }
}
