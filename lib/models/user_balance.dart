part of 'models.dart';

class UserBalance extends Equatable {
  final int id;
  final int user;
  final int balanceInt;

  UserBalance(
      {@required this.id, @required this.user, @required this.balanceInt});

  factory UserBalance.fromJson(Map<String, dynamic> json) => UserBalance(
        id: json['id'],
        user: json['user'],
        balanceInt: json['balanceInt'],
      );

  @override
  List<Object> get props => [id, user, balanceInt];
}
