part of 'pages.dart';

class CountDownPageQuiz extends StatefulWidget {
  List<Movie> list;
  int index;
  CountDownPageQuiz({this.list, this.index});

  @override
  _CountDownPageQuizState createState() => _CountDownPageQuizState();
}

class _CountDownPageQuizState extends State<CountDownPageQuiz> {
  int timer = 3;
  String showTimer = '3';

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    countdown();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  void countdown() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer == 2) {
          t.cancel();
        }
        timer = timer - 1;
      });
      showTimer = timer.toString();
    });
  }

  route() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => QuizPage2(
                  list: widget.list,
                  index: widget.index,
                )),
        (Route<dynamic> route) => false);
  }

  initScreen(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Center(
              child: Text(
                showTimer,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontFamily: "Approach",
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
