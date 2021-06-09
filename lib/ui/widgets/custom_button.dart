part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  List<Movie> list;
  int index;
  CustomButton({
    this.list,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    ChallengesHelper challengesHelper = new ChallengesHelper();
    QuizService quizService = new QuizService();
    SharedPreferences sharedPreferences;
    MovieDetails movieDetails;
    Quis quis;
    QuisAnswer quisAnswer;
    TextEditingController questionController = TextEditingController();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 50.0,
        width: MediaQuery.of(context).size.height - 2 * defaultMargin,
        child: FutureBuilder(
            future: challengesHelper.getDetails(list[index]),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                movieDetails = snapshot.data;
              }

              return RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))
                ),
                onPressed: () async {
                  sharedPreferences = await SharedPreferences.getInstance();
                  if (sharedPreferences.getString("access") == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 14.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              height: 400,
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 30, bottom: 40),
                                    child: Text(
                                        "Silahkan login terlebih dahulu",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Approach",
                                            fontWeight: FontWeight.w300)
                                        // blackTextFont.copyWith(fontSize: 18),
                                        ),
                                  ),
                                  AlertSignPage(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Belum punya akun Seekr? ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Approach",
                                              fontWeight: FontWeight.w300)
                                          // greyTextFont.copyWith(
                                          //     fontWeight: FontWeight.w400),
                                          ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                        },
                                        child: Text("Daftar",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Approach",
                                                color: Color(0XFF0061A8),
                                                fontWeight: FontWeight.w300)
                                            // purpleTextFont,
                                            ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    if (movieDetails.taskCount >= 1) {
                      quizService.hitButton(list[index]).whenComplete(() {
                        if (quizService.statusHitButton) {
                          if (quizService.data["result"] ==
                              'CHALLENGE_COMPLETE') {
                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Anda telah menyelesaikan quiz ini !!!",
                            )..show(context);
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CountDownPageQuiz(
                                          list: list,
                                          index: index,
                                        )),
                                (Route<dynamic> route) => false);
                          }
                        }
                      });
                    } else if (movieDetails.taskCount == 0) {
                      Flushbar(
                        duration: Duration(seconds: 4),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Soal pada quiz belum tersedia !!!",
                      )..show(context);
                    }
                  }
                },
                padding: EdgeInsets.all(10.0),
                color: Color(0xFFFF5713),
                textColor: Colors.white,
                child: (snapshot.hasData)
                    ? Text(
                        movieDetails.isAvailable == true
                            ? "I'M READY"
                            : "NOTIFY ME",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                        ),
                      ),
              );
            }),
      ),
    );
  }
}
