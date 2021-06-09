part of 'models.dart';

class MovieDetails extends Movie {
  final String url;
  final int id;
  final String user;
  final String challengeMaker;
  final String title;
  final String titleSlug;
  final String description;
  final String reward;
  final int rewardInt;
  final String image;
  final String difficultyLevel;      
  final String types;
  final String startedAt;
  final String finishedAt;
  final bool isFeatured;
  final bool isCompleted;
  final int taskCount;
  final String participantCount;
  final String challengeRuleHeadline;
  final String challengeRule;
  final bool isAvailable;
  // final String challengeRuleDescription;

  MovieDetails(
    Movie movie, {
    this.url,
    this.id,
    this.user,
    this.challengeMaker,
    this.title,
    this.titleSlug,
    this.description,
    this.reward,
    this.rewardInt,
    this.image,
    this.difficultyLevel,
    this.types,
    this.startedAt,
    this.finishedAt,
    this.isFeatured,
    this.isCompleted,
    this.taskCount,
    this.participantCount,
    this.challengeRuleHeadline,
    this.challengeRule,
    this.isAvailable,
    // this.challengeRuleDescription,
  });

  @override
  List<Object> get props =>
      super.props +
      [
        url,
        id,
        user,
        challengeMaker,
        title,
        titleSlug,
        description,
        reward,
        rewardInt,
        image,
        difficultyLevel,
        types,
        startedAt,
        finishedAt,
        isFeatured,
        isCompleted,
        taskCount,
        participantCount,
        challengeRuleHeadline,
        challengeRule,
        isAvailable
        // challengeRuleDescription
      ];
}
