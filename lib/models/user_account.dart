part of 'models.dart';

// OLD
// class UserAccount extends Equatable {
//   String email;
//   int id;
//   String username;

//   UserAccount({this.email, this.id, this.username});

//   factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
//       email: json['email'], id: json['id'], username: json['username']);

//   @override
//   List<Object> get props => [
//     email,
//     id,
//     username
//   ];
// }

// NEW
class UserAccount extends Equatable {
  final String url;
  final int id;
  final String username;
  final String name;
  final String email;
  final int profileID;

  UserAccount(
      {@required this.url,
      @required this.id,
      @required this.username,
      @required this.email,
      @required this.name,
      @required this.profileID});

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        url: json['url'],
        id: json['id'],
        username: json['username'],
        name: json['name'],
        email: json['email'],
        profileID: json['profile']['id'],
      );

  @override
  List<Object> get props => [url, id, username, email, name, profileID];
}
