part of 'models.dart';

class ChallengeCategory extends Equatable {
  final String key;

  ChallengeCategory({
    @required this.key,
  });

  factory ChallengeCategory.fromJson(Map<String, dynamic> json) =>
      ChallengeCategory(
        key: json['key'],
      );

  @override
  List<Object> get props => [
        key,
      ];
}
