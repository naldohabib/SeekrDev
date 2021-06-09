part of 'services.dart';

class QuizService {
  var status;
  var status2;
  var statusHitButton;
  var data;
  var data2;
  Quis quis;

  Future<Quis> hitButton(Movie movie, {int challenge}) async {
    final prefs = await SharedPreferences.getInstance();   
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        // ignore: unnecessary_brace_in_string_interps
        "https://bismillah-seekr.herokuapp.com/api/app-challenges/challengeTaker";

    http.Response response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "challenge": "${movie.id}",
    });

    statusHitButton = response.body.contains('result');

    data = json.decode(response.body);
    // print('data : $data');
    // print('DATA 1 ==> $data');

    if (statusHitButton) {
      if (data["result"] == 'CHALLENGE_COMPLETE') {
        print('hitButton ${data["result"]}');
      }
    }

    int id = (data as Map<String, dynamic>)['id'];
    int number = (data as Map<String, dynamic>)['number'];
    String promptType = (data as Map<String, dynamic>)['promptType'].toString();
    String promptText = (data as Map<String, dynamic>)['promptText'].toString();
    String promptImage =
        (data as Map<String, dynamic>)['promptImage'].toString();
    String promptVideo =
        (data as Map<String, dynamic>)['promptVideo'].toString();
    String messages = (data as Map<String, dynamic>)['messages'].toString();
    String result = (data as Map<String, dynamic>)["result"].toString();
    int taskTakerAnswer =
        (data as Map<String, dynamic>)['taskTakerAnswer']['id'];

    return challenge != null
        ? Quis(
            Movie.fromJson(data),
            id: id,
            number: number,
            promptType: promptType,
            promptText: promptText,
            promptImage: promptImage,
            promptVideo: promptVideo,
            // messages: messages,
            result: result,
            taskTakerAnswer: taskTakerAnswer,
            //  idTask: urltaskTakerAnswer
          )
        : Quis(  
            movie,
            id: id,
            number: number,
            promptType: promptType,
            promptText: promptText,
            promptImage: promptImage,
            promptVideo: promptVideo,
            // messages: messages,
            result: result,
            taskTakerAnswer: taskTakerAnswer,
            //  idTask: urltaskTakerAnswer
          );
  }

  Future<QuisAnswer> hitButtonYes(String answer, String idAnswer,
      {Movie movie, int iD}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        "https://bismillah-seekr.herokuapp.com/api/app-challenges/taskTakerAnswer/${idAnswer ?? iD}/";

    http.Response response = await http.patch(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: { 
      "answer": "$answer",
    });
    status = response.body.contains('result');
    status2 = response.body.contains('messages');
    // print(status);

    data2 = json.decode(response.body);
    print('DATA 2 ==> $data2');

    if (status) {
      if (data2["result"] == 'CHALLENGE_WINNER' ||
          data2["result"] == 'CHALLENGE_COMPLETE') {
        print('data : ${data2["result"]}');
      } else if (data2["result"] == "CHALLENGE_START" ||
          data2["result"] == "CHALLENGE_CONTINUE_NEXT") {
        print('data : ${data2["result"]}');
      } else if (data2["messages"] ==
          'Fail, Wrong Answer! challenge continue for the current task') {
        print('data : ${data2["messages"]}');
      }
    }

    String promptText =
        (data2 as Map<String, dynamic>)['promptText'].toString();
    int id = (data2 as Map<String, dynamic>)['id'];
    int number = (data2 as Map<String, dynamic>)['number'];
    String promptType = (data2 as Map<String, dynamic>)['promptType'];
    // String taskTakerAnswer = (data2 as Map<String, dynamic>)['taskTakerAnswer'];
    int taskTakerAnswer =
        (data2 as Map<String, dynamic>)['taskTakerAnswer']['id'];
    String messages = (data2 as Map<String, dynamic>)['messages'];
    // print('hitButtonYes $messages');

    return idAnswer != null
        ? QuisAnswer(Movie.fromJson(data2),
            id: id,
            number: number,
            promptType: promptType,
            promptText: promptText,
            taskTakerAnswer: taskTakerAnswer,
            messages: messages)
        : QuisAnswer(movie,
            id: id,
            number: number,
            promptType: promptType,
            promptText: promptText,
            taskTakerAnswer: taskTakerAnswer,
            messages: messages);
  }
}
