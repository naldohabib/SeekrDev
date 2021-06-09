part of 'pages.dart';

class ResultPage2 extends StatefulWidget {
  @override
  _ResultPage2State createState() => _ResultPage2State();
}

class _ResultPage2State extends State<ResultPage2> {
  Quis quis;
  @override
  Widget build(BuildContext context) {
    return AllConfettiWidget(
      child: Stack(
        children: [
          Background(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Anda telah menyelesaikan Quis',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Approach")),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 340,
                      height: 55,
                      child: RaisedButton(
                        // color: Color(0xFF3E9D9D),
                        color: Color(0xFFFF5713),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: "Approach")),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}