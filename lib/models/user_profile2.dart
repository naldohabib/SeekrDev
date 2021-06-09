part of 'models.dart';

class UserGetProfile extends Equatable {
  final String url;
  final int id;
  final String username;
  final String name;
  final String email;
  final int profileID;
  final int profilePhoneNumber;
  final String placeOfBirth;
  final String dateOfBirth;
  final String gender;
  final String status;

  UserGetProfile({
    @required this.url,
    @required this.id,
    @required this.username,
    @required this.email,
    @required this.name,
    @required this.profileID,
    @required this.profilePhoneNumber,
    @required this.placeOfBirth,
    @required this.dateOfBirth,
    @required this.gender,
    @required this.status,
  });

  factory UserGetProfile.fromJson(Map<String, dynamic> json) => UserGetProfile(
        url: json['url'],
        id: json['id'],
        username: json['username'],
        name: json['name'],
        email: json['email'],
        profileID: json['profile']['id'],
        profilePhoneNumber: json['profile']['phoneNumber'],
        placeOfBirth: json['profile']['placeOfBirth'],
        dateOfBirth: json['profile']['dateOfBirth'],
        gender: json['profile']['gender'],
        status: json['profile']['status'],
      );

  @override
  List<Object> get props => [
        url,
        id,
        username,
        email,
        name,
        profileID,
        profilePhoneNumber,
        placeOfBirth,
        dateOfBirth,
        gender,
        status
      ];
}
