part of 'models.dart';

class Movie extends Equatable {
  final String url;
  final int id;
  final String challengeMaker;
  final String title;
  final String titleSlug;     
  final String reward;
  final int rewardInt;
  final String image;
  final bool isFeatured;
  final bool isCompleted;
  final int taskCount;
  final String startedAt;

  Movie({
    @required this.url,
    @required this.id,
    @required this.challengeMaker,
    @required this.title,
    @required this.titleSlug,
    @required this.reward,
    @required this.rewardInt,
    @required this.image,
    @required this.isFeatured,
    @required this.isCompleted,
    @required this.taskCount,
    @required this.startedAt,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      url: json['url'],
      id: json['id'],
      challengeMaker: json['challengeMaker'],
      title: json['title'],
      titleSlug: json['titleSlug'],
      reward: json['reward'],
      rewardInt: json['rewardInt'],
      image: json['image'],
      isFeatured: json['isFeatured'],
      isCompleted: json['isCompleted'],
      taskCount: json['taskCount'],
      startedAt: json['startedAt']);

  @override
  List<Object> get props => [
        url,
        id,
        challengeMaker,
        title,
        titleSlug,
        reward,
        rewardInt,
        image,
        isFeatured,
        isCompleted,
        taskCount,
        startedAt
      ];
}