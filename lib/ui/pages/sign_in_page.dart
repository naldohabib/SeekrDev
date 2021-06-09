part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool isPasswordValid = false;
  bool isSignIn = false;

  String userNameID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: Image.asset("assets/logo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 40),
                  child: Text(
                    "Welcome Back,\nExplorer",
                    style: TextStyle(fontSize: 20, fontFamily: "Approach", fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username",
                      hintText: "Username"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 8;
                    });
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      hintText: "Password"),
                ),
                SizedBox(
                  height: 6,
                ),
                // Row(
                //   children: <Widget>[
                //     Text("Forget Password? ",
                //         style: greyTextFont.copyWith(
                //             fontSize: 12, fontWeight: FontWeight.w400)),
                //     Text("Get Now",
                //         style: purpleTextFont.copyWith(
                //           fontSize: 12,
                //         )),
                //   ],
                // ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 40, bottom: 30),
                    child: isSignIn
                        ? SpinKitFadingCircle(
                            color: Color(0XFFFA663B),
                          )
                        : FloatingActionButton(
                            elevation: 0,
                            child: Icon(Icons.arrow_forward,
                                color: isPasswordValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE)),
                            backgroundColor: isPasswordValid
                                ? Color(0XFFFA663B)
                                : Color(0xFFE4E4E4),
                            onPressed: isPasswordValid
                                ? () {
                                    setState(() {
                                      isSignIn = true;
                                    });
                                    _onPressed();
                                  }
                                : null,
                          ),
                  ),
                ),
                // Row(
                //   children: <Widget>[
                //     Text(
                //       "Start Fresh Now? ",
                //       style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             new MaterialPageRoute(
                //                 builder: (context) => SignUpPage()));
                //       },
                //       child: Text(
                //         "Sign Up",
                //         style: purpleTextFont,
                //       ),
                //     )
                //   ],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  _onPressed() {
    setState(() {
      if (_usernameController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .loginData(_usernameController.text.trim(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            setState(() {
              isSignIn = false;
            });
            Flushbar(
              duration: Duration(seconds: 4),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xFFFF5C83),
              message: "Username / Password Salah",
            )..show(context);
            // _showDialog();
            // msgStatus = 'Check email or password';
          } else {
            setState(() {
              // userNameID = _usernameController.text;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()),
                (Route<dynamic> route) => false);
          }
        });
      }
    });
  }
}
