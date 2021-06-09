part of 'models.dart';

class Register extends Equatable {
  String email;
  String username;
  int id;

  Register({this.email, this.username, this.id});

  factory Register.fromJson(Map<String, dynamic> json) => Register(
      email: json['email'], username: json['username'], id: json['id']);

  @override
  List<Object> get props => [
    email,
    username,
    id
  ];
}
