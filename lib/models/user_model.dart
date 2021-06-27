class UserModel {
  final String? displayName;
  final String? email;
  final String? photoURL;
  final String? uid;

  UserModel({
    required this.displayName,
    required this.email,
    this.photoURL,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'],
      email: map['email'],
      photoURL: map['photoURL'],
      uid: map['uid'],
    );
  }
}
