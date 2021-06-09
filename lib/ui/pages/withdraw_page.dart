part of 'pages.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Withdraw Balance",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontFamily: "Approach", fontWeight: FontWeight.w300,)
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: blackTextFont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Username",
                          hintText: "Username"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      height: 45,
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Withdraw Balance",
                          style: TextStyle(fontSize: 17, fontFamily: "Approach", fontWeight: FontWeight.w300, color: Colors.white)
                        ),
                        color: Color(0XFF0061A8),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 20, left: defaultMargin),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
