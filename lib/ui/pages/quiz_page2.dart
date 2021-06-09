part of 'pages.dart';

class QuizPage2 extends StatefulWidget {
  List<Movie> list;
  int index;
  QuizPage2({this.list, this.index});

  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  // Flutter VLC Player
  // Key _key = GlobalKey<ScaffoldState>();

  // VlcPlayerController vlcPlayerController;
  // bool isPlaying = true;
  // bool isBuffering = true;
  // String position = '';
  // String duration = '';
  // double sliderValue = 0.0;
  // double startValue = 0.0;
  // double volume = 80;

  QuizService quizService = new QuizService();
  ChallengesHelper challengesHelper = new ChallengesHelper();
  MovieDetails movieDetails;
  Quis quis;
  QuisAnswer quisAnswer;
  TextEditingController questionController = TextEditingController();
  bool _isLoading = false;
  bool disableAnswer = false;

  int j = 1;
  int i = 1;
  int answerPage = 0;
  var distinctIds = [];
  var status;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   vlcPlayerController = new VlcPlayerController(onInit: () {
  //     vlcPlayerController.play();
  //   });
  //   vlcPlayerController.addListener(() {
  //     if (!this.mounted) {
  //       return;
  //     }
  //     if (vlcPlayerController.initialized) {
  //       var Position = vlcPlayerController.position;
  //       var Duration = vlcPlayerController.duration;
  //       if (Duration.inHours == 0) {
  //         var startPosition = Position.toString().split('.')[0];
  //         var startDuration = Duration.toString().split('.')[0];
  //         position =
  //             '${startPosition.split(':')[1]}:${startPosition.split(':')[2]}';
  //         duration =
  //             '${startDuration.split(':')[1]};${startDuration.split(':')[2]}';
  //       } else {
  //         position = Position.toString().split('.')[0];
  //         duration = Duration.toString().split('.')[0];
  //       }
  //       sliderValue = vlcPlayerController.position.inSeconds.toDouble();

  //       switch (vlcPlayerController.playingState) {
  //         case PlayingState.PLAYING:
  //           setState(() {
  //             isBuffering = false;
  //           });
  //           break;
  //         case PlayingState.BUFFERING:
  //           setState(() {
  //             isBuffering = true;
  //           });
  //           break;

  //         case PlayingState.STOPPED:
  //           setState(() {
  //             isBuffering = false;
  //             isPlaying = false;
  //           });
  //           break;

  //         case PlayingState.PAUSED:
  //           setState(() {
  //             isPlaying = false;
  //             isBuffering = false;
  //           });
  //           break;

  //         case PlayingState.ERROR:
  //           setState(() {});
  //           print('Error cant play');
  //           break;

  //         default:
  //           setState(() {});
  //           break;
  //       }
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   vlcPlayerController.dispose();
  // }

  // void playAndPause() {
  //   String state = vlcPlayerController.playingState.toString();

  //   if (state == 'PlayingState.PLAYING') {
  //     vlcPlayerController.pause();
  //     setState(() {
  //       isPlaying = false;
  //     });
  //   } else {
  //     vlcPlayerController.play();
  //     setState(() {
  //       isPlaying = true;
  //     });
  //   }
  // }

  Widget answer() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.73,
            child: Container(
              child: TextField(
                controller: questionController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    hintText: "Your answer ...",
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
          ),
          // FloatingActionButton(
          //   elevation: 0,
          //   child: Icon(
          //     Icons.camera_alt,
          //     color: Colors.black,
          //   ),
          //   backgroundColor: Colors.white,
          //   onPressed: () {},
          // )
          FloatingActionButton(
            mini: false,
            backgroundColor: Colors.white,
            splashColor: Colors.black,
            onPressed: () {},
            hoverElevation: 1.5,
            shape: StadiumBorder(
                side: BorderSide(color: Color(0xFFFF5713), width: 2)),
            elevation: 1.5,
            child: Icon(
              Icons.camera_alt_outlined,
              color: Color(0xFFFF5713),
            ),
          )
        ],
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 370,
        height: 60,
        child: RaisedButton(
          elevation: 0,
          // color: Color(0xFF050E27),
          // color: Color(0xFF3E9D9D),
          color: Color(0xFFFF5713),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text("SUBMIT",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: "Approach")),
          onPressed: () {
            if (questionController.text == "") {
              Flushbar(
                duration: Duration(seconds: 4),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xFFFF5C83),
                message: "Jawaban tidak boleh kosong !!!",
              )..show(context);
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertButton();
                  });
            }
          },
        ),
      ),
    );
  }

  Widget alertButton() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        height: 200,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Are you sure ?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Container(
                              // padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 0,
                                highlightColor: Colors.black,
                                color: Color(0xFFFF5713).withOpacity(0.3),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Color(0xFFFF5713),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: "Approach"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    if (questionController.text
                                        .trim()
                                        .isNotEmpty) {
                                      quizService
                                          .hitButtonYes(questionController.text,
                                              quis.taskTakerAnswer.toString())
                                          .whenComplete(() {
                                        if (quizService.status) {
                                          if (quizService.data2["result"] ==
                                                  'CHALLENGE_WINNER' ||
                                              quizService.data2["result"] ==
                                                  'CHALLENGE_COMPLETE') {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            ResultPage2()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          } else if (quizService
                                                      .data2["result"] ==
                                                  'CHALLENGE_START' ||
                                              quizService.data2["result"] ==
                                                  'CHALLENGE_CONTINUE_NEXT') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        QuizPage2(
                                                          list: widget.list,
                                                          index: widget.index,
                                                        )));
                                            // Navigator.of(context).pop();
                                          } else if (quizService
                                                  .data2["messages"] ==
                                              'Fail, Wrong Answer! challenge continue for the current task') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        QuizPage2(
                                                          list: widget.list,
                                                          index: widget.index,
                                                        )));
                                            // Navigator.of(context).pop();
                                            Flushbar(
                                              duration: Duration(seconds: 4),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor:
                                                  Color(0xFFFF5C83),
                                              message: "Jawaban Anda Salah",
                                            )..show(context);
                                          }
                                        }
                                      });
                                    }
                                    questionController.clear();
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                SplashPageQuiz(
                                                  quis: quis,
                                                  quisAnswer: quisAnswer,
                                                )));
                                  });
                                },
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 0,
                                highlightColor: Colors.black,
                                color: Color(0xFFFF5713),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: "Approach"),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Seekr",
                    ),
                    content: Text("You Can't Go Back At This Stage ?"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => MainPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Ok',
                        ),
                      )
                    ],
                  ));
        },
        child: FutureBuilder(
          future: quizService.hitButton(widget.list[widget.index]),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              quis = snapshot.data;
            }

            return Scaffold(
              body: Container(
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          BackgroundQuis(),
                          ListView(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  (snapshot.hasData)
                                      ? Column(
                                          children: [
                                            if (quis.promptType == 'TEXT')
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 108),
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: (snapshot.hasData)
                                                        ? Text(
                                                            quis.promptText,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 35,
                                                                fontFamily:
                                                                    "Approach",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        : SpinKitFadingCircle(
                                                            color:
                                                                Colors.white)),
                                              )
                                            else if (quis.promptType == 'IMAGE')
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: (snapshot.hasData)
                                                      ? Column(
                                                          children: [
                                                            Container(
                                                              width: 350.0,
                                                              height: 250.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            imageBaseURL2 +
                                                                                quis.promptImage,
                                                                          ),
                                                                          fit: BoxFit.cover)),
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                              quis.promptText,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      "Approach",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            )
                                                          ],
                                                          // child: Container(
                                                          //     width: 400.0,
                                                          //     height: 250.0,
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //             borderRadius:
                                                          //                 BorderRadius
                                                          //                     .circular(
                                                          //                         5.0),
                                                          //             image: DecorationImage(
                                                          //                 image: NetworkImage(
                                                          //                   imageBaseURL2 +
                                                          //                       quis.promptImage,
                                                          //                 ),
                                                          //                 fit: BoxFit.cover)),
                                                          //   ),
                                                        )
                                                      : SpinKitFadingCircle(
                                                          color: Colors.white))
                                            else if (quis.promptType == 'VIDEO')
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: (snapshot.hasData)
                                                      ? Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  2 * defaultMargin,
                                                              height: 250.0,
                                                              child: Video(
                                                                videoPlayerController:
                                                                    VideoPlayerController.network(
                                                                        imageBaseURL2 +
                                                                            quis.promptVideo),
                                                                looping: false,
                                                                // autoplay: true,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  2 * defaultMargin,
                                                              child: Text(
                                                                quis.promptText,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontFamily:
                                                                        "Approach",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      : SpinKitFadingCircle(
                                                          color: Colors.white,
                                                        )),
                                            // Column(
                                            //   children: [
                                            //     SizedBox(
                                            //         height: 250,
                                            //         child: (snapshot.hasData)
                                            //             ? new VlcPlayer(
                                            //                 controller:
                                            //                     vlcPlayerController,
                                            //                 aspectRatio:
                                            //                     16 / 9,
                                            //                 url: imageBaseURL2 +
                                            //                     quis
                                            //                         .promptVideo,
                                            //                 isLocalMedia:
                                            //                     false,
                                            //                 placeholder:
                                            //                     SpinKitFadingCircle(
                                            //                   color: Colors
                                            //                       .white,
                                            //                 ))
                                            //             : SpinKitFadingCircle(
                                            //                 color:
                                            //                     Colors.white,
                                            //               )),
                                            //     Row(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment
                                            //               .spaceAround,
                                            //       mainAxisSize:
                                            //           MainAxisSize.max,
                                            //       children: [
                                            //         Flexible(
                                            //           flex: 1,
                                            //           child: FlatButton(
                                            //             onPressed: () {
                                            //               playAndPause();
                                            //             },
                                            //             child: isPlaying
                                            //                 ? Icon(
                                            //                     Icons
                                            //                         .pause_circle_outline,
                                            //                     color: Colors
                                            //                         .white,
                                            //                   )
                                            //                 : Icon(
                                            //                     Icons
                                            //                         .play_circle_outline,
                                            //                     color: Colors
                                            //                         .white,
                                            //                   ),
                                            //           ),
                                            //         ),
                                            //         Flexible(
                                            //           flex: 3,
                                            //           child: Row(
                                            //             mainAxisAlignment:
                                            //                 MainAxisAlignment
                                            //                     .spaceBetween,
                                            //             mainAxisSize:
                                            //                 MainAxisSize.max,
                                            //             children: [
                                            //               Text(position,
                                            //                   style: TextStyle(
                                            //                       color: Colors
                                            //                           .white)),
                                            //               Expanded(
                                            //                 child: Slider(
                                            //                     value:
                                            //                         sliderValue,
                                            //                     activeColor:
                                            //                         Colors
                                            //                             .red,
                                            //                     min: 0.0,
                                            //                     max: vlcPlayerController
                                            //                                 .duration ==
                                            //                             null
                                            //                         ? 1.0
                                            //                         : vlcPlayerController
                                            //                             .duration
                                            //                             .inSeconds
                                            //                             .toDouble(),
                                            //                     onChanged:
                                            //                         (progress) {
                                            //                       setState(
                                            //                           () {
                                            //                         sliderValue = progress
                                            //                             .floor()
                                            //                             .toDouble();
                                            //                       });
                                            //                       vlcPlayerController.setTime(
                                            //                           sliderValue.toInt() *
                                            //                               1000);
                                            //                     }),
                                            //               ),
                                            //               Text(duration,
                                            //                   style: TextStyle(
                                            //                       color: Colors
                                            //                           .white)),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ],
                                            // )
                                          ],
                                        )
                                      : SpinKitFadingCircle(color: Colors.white)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          BackgroundAnswer(),
                          AbsorbPointer(
                            absorbing: disableAnswer,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  answer(),
                                  submitButton(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class SplashPageQuiz extends StatefulWidget {
  Quis quis;
  QuisAnswer quisAnswer;
  SplashPageQuiz({this.quis, this.quisAnswer});

  @override
  _SplashPageQuizState createState() => _SplashPageQuizState();
}

class _SplashPageQuizState extends State<SplashPageQuiz> {
  QuizService quizService = QuizService();
  ChallengesHelper challengesHelper = new ChallengesHelper();
  MovieDetails movieDetails;
  TextEditingController questionController = TextEditingController();
  Quis quis;
  QuisAnswer quisAnswer;

  var check;
  var checkJwbn;

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    checkAnswer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    if (quizService.status) {
      if (quizService.data2["result"] == 'CHALLENGE_WINNER' ||
          quizService.data2["result"] == 'CHALLENGE_COMPLETE') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => ResultPage2()),
            (Route<dynamic> route) => false);
      } else if (quizService.data2["result"] == 'CHALLENGE_START' ||
          quizService.data2["result"] == 'CHALLENGE_CONTINUE_NEXT') {
        // Navigator.of(context).pop();
      }
    }
  }

  checkAnswer() {
    if (widget.quis.messages ==
        'Fail, Wrong Answer! challenge continue for the current task') {
      return;
    }
  }

  initScreen(BuildContext context) {
    return FutureBuilder(builder: (_, snapshot) {
      if (snapshot.hasData) {
        widget.quisAnswer = snapshot.data;
      }

      return Stack(
        children: [
          Background(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 300),
                    height: 80,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "${widget.quis.number} of ${widget.quis.taskCount}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 38,
                            fontFamily: "Approach",
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
