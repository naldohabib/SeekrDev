part of 'pages.dart';

// NEW
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserService userService = new UserService();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
      child: new FutureBuilder<List<UserAccount>>(
          future: userService.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new GetUser(
                    list: snapshot.data,
                  )
                : new NoUser(
                    list: snapshot.data,
                  );
          }),
    );
  }
}

class NoUser extends StatefulWidget {
  List<UserAccount> list;
  NoUser({this.list});
  @override
  _NoUserState createState() => _NoUserState();
}

class _NoUserState extends State<NoUser> {
  SharedPreferences sharedPreferences;
  String userId;
  bool isLoggedIn = false;
  String userNameID = '';

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("username");

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        userNameID = userId;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/user.png"), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Guest',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Approach"),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (userId != null) {
                    sharedPreferences.clear();
                    sharedPreferences.commit();

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainPage()),
                        (Route<dynamic> route) => false);
                  } else {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SignInPage()));
                  }
                });
              },
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        2 * defaultMargin -
                        161,
                    child: Text(
                      userId != null ? 'Log Out' : 'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Approach",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Container(
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetUser extends StatefulWidget {
  List<UserAccount> list;
  GetUser({this.list});

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  SharedPreferences sharedPreferences;
  UserBalanceService userBalanceService = new UserBalanceService();
  String userId;
  bool isLoggedIn = false;
  String userNameID = '';

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("username");

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        userNameID = userId;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 60),
          itemCount: widget.list == null ? 0 : widget.list.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/user.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (userId != null) {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => UpdateAccountPage(
                                          // userAccount: userAccount,
                                          )));
                            } else {}
                          });
                        },
                        child: userId != null
                            ? Container(
                                child: widget.list[index] != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.list[index].username
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 27,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Approach"),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 28,
                                          )
                                        ],
                                      )
                                    : SpinKitFadingCircle(
                                        color: Color(0XFF0061A8),
                                      ))
                            : Text(
                                'Guest',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Approach"),
                              )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child:
                          // userId != null
                          //     ?
                          Container(
                    width: 50,
                    height: 30,
                    child: FutureBuilder<List<UserBalance>>(
                        future: userBalanceService.getUserBalance(),
                        builder: (_, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? new GetUserBalance(list: snapshot.data)
                              : Center(child: new Text(" - "));
                        }),
                  )
                      // : Text("IDR - "),
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: new Container(
                              child: Divider(
                        color: Colors.black,
                        height: 50,
                      )))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // widget.list[index] != null
                  //     ? Text(
                  //         widget.list[index].username.toString(),
                  //         style: TextStyle(
                  //             fontSize: 27,
                  //             fontWeight: FontWeight.w300,
                  //             fontFamily: "Approach"),
                  //       )
                  //     : Text(
                  //         'Guest',
                  //         style: TextStyle(
                  //             fontSize: 27,
                  //             fontWeight: FontWeight.w300,
                  //             fontFamily: "Approach"),
                  //       ),
                  Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => UpdateProfile(
                                    // userProfile: widget.userProfile,
                                    // list: widget.list,
                                    // index: widget.index,
                                    )));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin -
                                    161,
                                child: Text(
                                  "Personal Info",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Approach",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Container(
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: new Container(
                                      child: Divider(
                                color: Colors.black,
                                height: 50,
                              )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => WithdrawPage()));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin -
                                    161,
                                child: Text(
                                  "Tarik Saldo",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Approach",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Container(
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: new Container(
                                      child: Divider(
                                color: Colors.black,
                                height: 50,
                              )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (userId != null) {
                            sharedPreferences.clear();
                            sharedPreferences.commit();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainPage()),
                                (Route<dynamic> route) => false);
                          } else {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          }
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultMargin -
                                161,
                            child: Text(
                              userId != null ? 'Log Out' : 'Log In',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Approach",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Container(
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

// OLD
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   SharedPreferences sharedPreferences;
//   bool isLoggedIn = false;
//   String userNameID = '';
//   String userId;
//   Register register;
//   UserAccount userAccount;
//   UserBalance userBalance;

//   final TextEditingController _usernameController = new TextEditingController();
//   UserService userService = new UserService();
//   UserBalanceService userBalanceService = new UserBalanceService();

//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   checkLoginStatus() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     userId = sharedPreferences.getString("username");

//     if (userId != null) {
//       setState(() {
//         isLoggedIn = true;
//         userNameID = userId;
//       });
//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//         child: FutureBuilder(
//           future: userService.getUser(),
//           builder: (_, snapshot) {
//             if (snapshot.hasData) {
//               userAccount = snapshot.data;
//             }

//             return Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Center(
//                   child: Container(
//                     height: 110,
//                     width: 110,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: AssetImage("assets/user.png"),
//                             fit: BoxFit.cover)),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Container(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (userId != null) {
//                           Navigator.push(
//                               context,
//                               new MaterialPageRoute(
//                                   builder: (context) => UpdateAccountPage(
//                                       // userAccount: userAccount,
//                                       )));
//                         } else {}
//                       });
//                     },
//                     child: userId != null
//                         ? Center(
//                             child: Container(
//                                 child: (snapshot.hasData)
//                                     ? Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             userAccount.username,
//                                             style: TextStyle(
//                                                 fontSize: 27,
//                                                 fontWeight: FontWeight.w300,
//                                                 fontFamily: "Approach"),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Icon(
//                                             Icons.edit,
//                                             color: Colors.black,
//                                             size: 28,
//                                           )
//                                         ],
//                                       )
//                                     : SpinKitFadingCircle(
//                                         color: Color(0XFF0061A8),
//                                       )),
//                           )
//                         : Text(
//                             'Guest',
//                             style: TextStyle(
//                                 fontSize: 27,
//                                 fontWeight: FontWeight.w300,
//                                 fontFamily: "Approach"),
//                           ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 // Text(
//                 //   'Premium Member',
//                 //   style: TextStyle(
//                 //       fontSize: 19,
//                 //       fontWeight: FontWeight.w300,
//                 //       fontFamily: "Approach",
//                 //       color: Color(0XFF0061A8)),
//                 // ),
//                 Center(
//                     child:
//                         // userId != null
//                         //     ?
//                         Container(
//                   width: 50,
//                   height: 30,
//                   child: FutureBuilder<List<UserBalance>>(
//                       future: userBalanceService.getUserBalance(),
//                       builder: (_, snapshot) {
//                         if (snapshot.hasError) print(snapshot.error);
//                         return snapshot.hasData
//                             ? new GetUserBalance(list: snapshot.data)
//                             : Center(child: new Text(" - "));
//                       }),
//                 )
//                     // : Text("IDR - "),
//                     ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: new Container(
//                             child: Divider(
//                       color: Colors.black,
//                       height: 50,
//                     )))
//                   ],
//                 ),
//                 userId != null
//                     ? Container(
//                         margin: EdgeInsets.only(left: 0, right: 0),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 new MaterialPageRoute(
//                                     builder: (context) => UpdateProfile(
//                                         // userProfile: widget.userProfile,
//                                         // list: widget.list,
//                                         // index: widget.index,
//                                         )));
//                           },
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width -
//                                         2 * defaultMargin -
//                                         131,
//                                     child: Text(
//                                       "Personal Info",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontFamily: "Approach",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 110,
//                                   ),
//                                   Container(
//                                     child: Icon(
//                                       Icons.navigate_next,
//                                       color: Colors.black,
//                                       size: 20,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: new Container(
//                                           child: Divider(
//                                     color: Colors.black,
//                                     height: 50,
//                                   )))
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     : Text(""),
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //         child: new Container(
//                 //             child: Divider(
//                 //       color: Colors.black,
//                 //       height: 50,
//                 //     )))
//                 //   ],
//                 // ),
//                 userId != null
//                     ? Container(
//                         margin: EdgeInsets.only(left: 0, right: 0),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 new MaterialPageRoute(
//                                     builder: (context) => WithdrawPage()));
//                           },
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width -
//                                         2 * defaultMargin -
//                                         131,
//                                     child: Text(
//                                       "Tarik Saldo",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontFamily: "Approach",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 110,
//                                   ),
//                                   Container(
//                                     child: Icon(
//                                       Icons.navigate_next,
//                                       color: Colors.black,
//                                       size: 20,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: new Container(
//                                           child: Divider(
//                                     color: Colors.black,
//                                     height: 50,
//                                   )))
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     : Text(""),
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //         child: new Container(
//                 //             child: Divider(
//                 //       color: Colors.black,
//                 //       height: 50,
//                 //     )))
//                 //   ],
//                 // ),
//                 Container(
//                   margin: EdgeInsets.only(left: 0, right: 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (userId != null) {
//                           sharedPreferences.clear();
//                           sharedPreferences.commit();

//                           Navigator.of(context).pushAndRemoveUntil(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       MainPage()),
//                               (Route<dynamic> route) => false);
//                         } else {
//                           Navigator.push(
//                               context,
//                               new MaterialPageRoute(
//                                   builder: (context) => SignInPage()));
//                         }
//                       });
//                     },
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width -
//                               2 * defaultMargin -
//                               131,
//                           child: Text(
//                             userId != null ? 'Log Out' : 'Log In',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: "Approach",
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 110,
//                         ),
//                         Container(
//                           child: Icon(
//                             Icons.navigate_next,
//                             color: Colors.black,
//                             size: 20,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class GetUserBalance extends StatefulWidget {
  List<UserBalance> list;
  GetUserBalance({this.list});

  @override
  _GetUserBalanceState createState() => _GetUserBalanceState();
}

class _GetUserBalanceState extends State<GetUserBalance> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.list == null ? 0 : widget.list.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(
                  "IDR " + widget.list[index].balanceInt.toString(),
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Approach",
                      color: Color(0XFF0061A8)),
                ),
              );
            }));
  }
}
