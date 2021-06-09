part of 'models.dart';

class QuisAnswer extends Movie {
  int id;
  int number;
  String promptType;
  String promptText;
  Null promptImage;
  Null promptVideo;
  bool isMultipleChoice;
  String messages;
  String result;
  int taskTakerAnswer;

  QuisAnswer(Movie movie,
      {this.id,
      this.number,
      this.promptType,
      this.promptText,
      this.promptImage,
      this.promptVideo,
      this.isMultipleChoice,
      this.messages,
      this.result,
      this.taskTakerAnswer})
      : super(
            id: movie.id,
            title: movie.title,
            image: movie.image,
            challengeMaker: movie.challengeMaker,
            url: movie.url,
            taskCount: movie.taskCount,
            isCompleted: movie.isCompleted,
            reward: movie.reward,
            rewardInt: movie.rewardInt,
            startedAt: movie.startedAt,
            titleSlug: movie.titleSlug,
            isFeatured: movie.isFeatured);

  @override
  List<Object> get props =>
      super.props +
      [
        id,
        number,
        promptType,
        promptText,
        promptImage,
        promptVideo,
        isMultipleChoice,
        messages,
        result,
        taskTakerAnswer,
        taskCount
      ];
}
