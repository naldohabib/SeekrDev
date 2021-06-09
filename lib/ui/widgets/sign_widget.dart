part of 'widgets.dart';

class AlertSignPage extends StatefulWidget {
  @override
  _AlertSignPageState createState() => _AlertSignPageState();
}

class _AlertSignPageState extends State<AlertSignPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool isPasswordValid = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Username",
                hintText: "Username"),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            onChanged: (text) {
              setState(() {
                isPasswordValid = text.length >= 6;
              });
            },
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Password",
                hintText: "Password"),
          ),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Container(
              width: 50,
              height: 50,
              // margin: EdgeInsets.only(top: 40, bottom: 30),
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
                      backgroundColor:
                          isPasswordValid ? Color(0XFFFA663B) : Color(0xFFE4E4E4),
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
        ],
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
          } else {
            setState(() {
              // userNameID = _usernameController.text;
            });
            Navigator.of(context).pop();
          }
        });
      }
    });
  }
}
