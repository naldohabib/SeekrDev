part of 'models.dart';

class Quis extends Movie {
  int id;
  int number;
  String promptType;
  String promptText;
  String promptImage;
  String promptVideo;
  bool isMultipleChoice;
  String messages;
  String result;
  int taskTakerAnswer;

  Quis(Movie movie,
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

class TaskTakerAnswer {
  String url;
  int id;
  int task;
  int challengeTaker;
  String startedAt;
  String finishedAt;
  String answer;
  bool isTrue;

  TaskTakerAnswer(
      {this.url,
      this.id,
      this.task,
      this.challengeTaker,
      this.startedAt,
      this.finishedAt,
      this.answer,
      this.isTrue});

  TaskTakerAnswer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    task = json['task'];
    challengeTaker = json['challengeTaker'];
    startedAt = json['startedAt'];
    finishedAt = json['finishedAt'];
    answer = json['answer'];
    isTrue = json['isTrue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['task'] = this.task;
    data['challengeTaker'] = this.challengeTaker;
    data['startedAt'] = this.startedAt;
    data['finishedAt'] = this.finishedAt;
    data['answer'] = this.answer;
    data['isTrue'] = this.isTrue;
    return data;
  }
}
