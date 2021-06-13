part of 'pages.dart';

// NEW
class UpdateAccountPage extends StatefulWidget {
  @override
  _UpdateAccountPageState createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _idController = new TextEditingController();
  Register register;

  UserService userService = new UserService();
  DatabaseHelper databaseHelper = new DatabaseHelper();
  UserAccount userAccount;
  UserGetProfile userGetProfile;
  bool isUpdateAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          FutureBuilder<List<UserGetProfile>>(
              future: userService.getUserProfileList(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  List<UserGetProfile> profiles = snapshot.data;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: profiles
                              .map((profile) => Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("Edit Your\nAccount",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Approach",
                                            fontWeight: FontWeight.w300,
                                          )),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      (snapshot.hasData)
                                          ? Container(
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller:
                                                        _usernameController
                                                          ..text =
                                                              profile.username,
                                                    style: blackTextFont,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        labelText: "Username",
                                                        hintText: "Username"),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    controller: _nameController
                                                      ..text = profile.name,
                                                    style: blackTextFont,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        labelText: "Username",
                                                        hintText: "Username"),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    controller: _emailController
                                                      ..text = profile.email,
                                                    style: blackTextFont,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        labelText: "Username",
                                                        hintText: "Username"),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  isUpdateAccount
                                                      ? SpinKitFadingCircle(
                                                          color:
                                                              Color(0XFF0061A8),
                                                        )
                                                      : SizedBox(
                                                          width: 250,
                                                          height: 45,
                                                          child: RaisedButton(
                                                            elevation: 0,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                            child: Text(
                                                                "Update My Account",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontFamily:
                                                                        "Approach",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    color: Colors
                                                                        .white)),
                                                            color: Color(
                                                                0XFF0061A8),
                                                            onPressed: () {
                                                              setState(() {
                                                                isUpdateAccount =
                                                                    true;
                                                              });
                                                              _onPressed(
                                                                  profile.id);
                                                            },
                                                          ),
                                                        )
                                                ],
                                              ),
                                            )
                                          : Center(
                                              child: SpinKitFadingCircle(
                                                color: Color(0XFF0061A8),
                                              ),
                                            )
                                    ],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                  // userAccount = snapshot.data;
                } else if (snapshot.hasError) {
                  return snapshot.error;
                }

                return new Center(
                  child: new Column(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.all(50.0)),
                      new SpinKitFadingCircle(
                        color: Color(0XFF0061A8),
                      )
                    ],
                  ),
                );
              }),
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

  _onPressed(int id) {
    setState(() {
      userService
          .updateAccount(_usernameController.text, _nameController.text,
              _emailController.text, id.toString())
          .whenComplete(() {
        if (userService.status) {
          setState(() {
            isUpdateAccount = false;
          });
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFFFF5C83),
            message: userService.data["username"].toString(),
          )..show(context);
        }
        if (userService.status2) {
          setState(() {
            // _usernameController.clear();
            // Navigator.of(context).pop();
          });
          // Navigator.of(context).pop();
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ProfilePage()));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MainPage()),
              (Route<dynamic> route) => false);
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFFFF5C83),
            message: "Success Update Account",
          )..show(context);
        }
      });
    });
  }
}

// OLD
// class UpdateAccountPage extends StatefulWidget {
//   @override
//   _UpdateAccountPageState createState() => _UpdateAccountPageState();
// }

// class _UpdateAccountPageState extends State<UpdateAccountPage> {
//   final TextEditingController _usernameController = new TextEditingController();
//   Register register;

//   UserService userService = new UserService();
//   DatabaseHelper databaseHelper = new DatabaseHelper();
//   UserAccount userAccount;
//   bool isUpdateAccount = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           FutureBuilder(
//               future: userService.getUser(),
//               builder: (_, snapshot) {
//                 if (snapshot.hasData) {
//                   userAccount = snapshot.data;
//                 }

//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//                   child: ListView(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text("Edit Your\nAccount",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontFamily: "Approach",
//                                 fontWeight: FontWeight.w300,
//                               )),
//                           SizedBox(
//                             height: 50,
//                           ),
//                           (snapshot.hasData)
//                               ? Container(
//                                   child: Column(
//                                     children: [
//                                       TextField(
//                                         controller: _usernameController
//                                           ..text = userAccount.username,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Username",
//                                             hintText: "Username"),
//                                       ),
//                                       SizedBox(
//                                         height: 30,
//                                       ),
//                                       isUpdateAccount
//                                           ? SpinKitFadingCircle(
//                                               color: Color(0XFF0061A8),
//                                             )
//                                           : SizedBox(
//                                               width: 250,
//                                               height: 45,
//                                               child: RaisedButton(
//                                                 elevation: 0,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8)),
//                                                 child: Text("Update My Account",
//                                                     style: TextStyle(
//                                                         fontSize: 17,
//                                                         fontFamily: "Approach",
//                                                         fontWeight:
//                                                             FontWeight.w300,
//                                                         color: Colors.white)),
//                                                 color: Color(0XFF0061A8),
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     isUpdateAccount = true;
//                                                   });
//                                                   _onPressed();
//                                                 },
//                                               ),
//                                             )
//                                     ],
//                                   ),
//                                 )
//                               : Center(
//                                   child: SpinKitFadingCircle(
//                                     color: Color(0XFF0061A8),
//                                   ),
//                                 )
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               }),
//           SafeArea(
//               child: Container(
//             margin: EdgeInsets.only(top: 20, left: defaultMargin),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }

//   _onPressed() {
//     setState(() {
//       userService
//           .updateAccount(_usernameController.text, userAccount.id.toString())
//           .whenComplete(() {
//         print(userAccount.id);
//         if (userService.status) {
//           setState(() {
//             isUpdateAccount = false;
//           });
//           Flushbar(
//             duration: Duration(seconds: 4),
//             flushbarPosition: FlushbarPosition.TOP,
//             backgroundColor: Color(0xFFFF5C83),
//             message: userService.data["username"].toString(),
//           )..show(context);
//         }
//         if (userService.status2) {
//           setState(() {
//             // _usernameController.clear();
//             // Navigator.of(context).pop();
//           });
//           // Navigator.of(context).pop();
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => ProfilePage()));
//           Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (BuildContext context) => MainPage()),
//               (Route<dynamic> route) => false);
//           Flushbar(
//             duration: Duration(seconds: 4),
//             flushbarPosition: FlushbarPosition.TOP,
//             backgroundColor: Color(0xFFFF5C83),
//             message: "Success Update Account",
//           )..show(context);
//         }

//         // if (userService.status) {
//         //   if (userService.data["username"] ==
//         //           'Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters.' ||
//         //       userService.data["username"] == 'This field may not be blank.' ||
//         //       userService.data["username"] ==
//         //           'A user with that username already exists.') {
//         //     Flushbar(
//         //       duration: Duration(seconds: 4),
//         //       flushbarPosition: FlushbarPosition.TOP,
//         //       backgroundColor: Color(0xFFFF5C83),
//         //       message: userService.data["username"].toString(),
//         //       // message: 'sfsfsdfsd',
//         //     )..show(context);
//         //   } else {

//         //   }
//         //   // else if (!(userService.data["username"] !=
//         //   //         'Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters.' ||
//         //   //     userService.data["username"] != 'This field may not be blank.' ||
//         //   //     userService.data["username"] !=
//         //   //         'A user with that username already exists.')) {
//         //   //   _usernameController.clear();
//         //   //   Navigator.push(context,
//         //   //       new MaterialPageRoute(builder: (context) => ProfilePage()));
//         //   //   Flushbar(
//         //   //     duration: Duration(seconds: 4),
//         //   //     flushbarPosition: FlushbarPosition.TOP,
//         //   //     backgroundColor: Colors.green,
//         //   //     message: "Success Update Account",
//         //   //   )..show(context);
//         //   // }
//         // }
//       });
//     });
//   }
// }
