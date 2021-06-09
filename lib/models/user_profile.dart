part of 'models.dart';

class UserProfile {
  final String url;
  final int id;
  final String user;
  final int phoneNumber;
  final String placeOfBirth;
  final String dateOfBirth;
  final String gender;
  final String status;
  final String image;

  UserProfile(
      {this.url,
      this.id,
      this.user,
      this.phoneNumber,
      this.placeOfBirth,
      this.dateOfBirth,
      this.gender,
      this.status,
      this.image});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return new UserProfile(
        url: json['url'].toString(),
        id: json['id'],
        user: json['user'].toString(),
        phoneNumber: json['phoneNumber'],
        placeOfBirth: json['placeOfBirth'].toString(),
        dateOfBirth: json['dateOfBirth'].toString(),
        gender: json['gender'].toString(),
        status: json['status'].toString(),
        image: json['image'].toString());
  }
}


// class UserProfile extends Equatable {
//   String url;
//   int id;
//   String user;
//   int phoneNumber;
//   String placeOfBirth;
//   String dateOfBirth;
//   String gender;
//   String status;
//   String image;  

//   UserProfile(
//       {this.url,
//       this.id,
//       this.user,
//       this.phoneNumber,
//       this.placeOfBirth,
//       this.dateOfBirth,
//       this.gender,
//       this.status,
//       this.image});

//   factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
//       url: json['url'],
//       id: json['id'],
//       user: json['user'],
//       phoneNumber: json['phoneNumber'],
//       placeOfBirth: json['placeOfBirth'],
//       dateOfBirth: json['dateOfBirth'],
//       gender: json['gender'],
//       status: json['status'],
//       image: json['image']);

//   @override
//   List<Object> get props => [
//     url,
//     id,
//     user,
//     phoneNumber,
//     placeOfBirth,
//     dateOfBirth,
//     gender,
//     status,
//     image
//   ];
// }
