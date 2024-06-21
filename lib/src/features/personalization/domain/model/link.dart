class Link {
  final String platformName;
  final String platformImage;
  final String platformLink;

  Link({
    required this.platformName,
    required this.platformImage,
    required this.platformLink,
  });

  //For fromJson Constructor
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      platformName: json['platformName'],
      platformImage: json['platformImage'],
      platformLink: json['platformLink'],
    );
  }

  //For toJson Constructor
  Map<String, dynamic> toJson() {
    return {
      'platformName': platformName,
      'platformImage': platformImage,
      'platformLink': platformLink
    };
  }
}
