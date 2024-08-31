import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String session;
  String profilePicture;
  String? bio;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.session,
    required this.profilePicture,
    this.bio,
  });

  /// get full name
  String get fullName => '$firstName $lastName';

  // to split the full name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //generate username from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length> 1 ? nameParts[1].toLowerCase() : "" ;
    String camelCaseUserName = "$firstName$lastName";
    String userNameWithFixedPrefix = 'alumni_$camelCaseUserName';
    return userNameWithFixedPrefix;
  }

  ///Static function to create a empty user model
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNumber: '',
    session: ' ',
    profilePicture: '',
    bio: ' ',
  );
  ///Convert model to JSON structure for storing data to Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Bio': bio,
    };
  }

  ///Factory method to create a UserModel from the Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        session: data['Session'],
        profilePicture: data['ProfilePicture'] ?? '',
        bio: data['Bio'] ?? ''
      );
    } else {
      return UserModel.empty();
    }
  }

}
