part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController retypePasswordController =
      new TextEditingController();

  DatabaseHelper databaseHelper = new DatabaseHelper();

  bool _isLoading = false;
  bool isSignUp = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();

        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 22),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Create New\nAccount",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Approach",
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 104,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/user.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/btn_add_photo.png"))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
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
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email",
                        hintText: "Email"),
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
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 8;
                      });
                    },
                    controller: retypePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 0, bottom: 30),
                      child: isSignUp
                          ? SpinKitFadingCircle(
                              color: Color(0XFFFA663B),
                            )
                          : FloatingActionButton(
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid & isPasswordValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                              backgroundColor: isEmailValid & isPasswordValid
                                  ? Color(0XFFFA663B)
                                  : Color(0xFFE4E4E4),
                              elevation: 0,
                              onPressed: isEmailValid & isPasswordValid
                                  ? () {
                                      setState(() {
                                        isSignUp = true;
                                      });
                                      _onPressed();
                                    }
                                  : null,
                            ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    setState(() {
      if (!(_usernameController.text.trim() != "" &&
          _emailController.text.trim() != "" &&
          _passwordController.text.trim() != "" &&
          retypePasswordController.text.trim() != "")) {
        setState(() {
          isSignUp = false;
        });
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xFFFF5C83),
          message: "Please fill all the fields",
        )..show(context);
      } else if (_passwordController.text != retypePasswordController.text) {
        setState(() {
          isSignUp = false;
        });
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xFFFF5C83),
          message: "Not suitable password and confirmed password",
        )..show(context);
      } else if (_passwordController.text.length < 8) {
        setState(() {
          isSignUp = false;
        });
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xFFFF5C83),
          message: "Password's length min 8 character",
        )..show(context);
      } else {
        databaseHelper
            .registerData(_usernameController.text.trim(),
                _emailController.text.trim(), _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status2) {
            setState(() {
              isSignUp = false;
            });
            Flushbar(
              duration: Duration(seconds: 4),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xFFFF5C83),
              message: databaseHelper.data["username"].toString(),
              // message: "Username telah dipake",
            )..show(context);
            // _showDialog();
            // msgStatus = 'Check email or password';
          }
          if (databaseHelper.status3) {
            setState(() {
              isSignUp = false;
            });
            Flushbar(
              duration: Duration(seconds: 4),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xFFFF5C83),
              message: databaseHelper.data["password"].toString(),
              // message: "The password is too similar to the username",
            )..show(context);
          }
          if (databaseHelper.status4) {
            setState(() {
              isSignUp = false;
            });
            // Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage()),
                (Route<dynamic> route) => false);
            Flushbar(
              duration: Duration(seconds: 5),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xFFFF5C83),
              message: "Berhasil membuat akun",
            )..show(context);
          }
        });
      }
    });
  }
}
