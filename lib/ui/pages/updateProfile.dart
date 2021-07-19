part of 'pages.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _placeController = new TextEditingController();
  final TextEditingController _dateController = new TextEditingController();
  final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _statusController = new TextEditingController();

  UserService userService = new UserService();
  bool isUpdateProfile = false;

  @override
  Widget build(BuildContext context) {
    UserService userService = new UserService();
    List gender = ["Male", "Female"];
    String select;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          new FutureBuilder<List<UserGetProfile>>(
            future: userService.getUserProfileList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<UserGetProfile> profiles = snapshot.data;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: ListView(
                    children: <Widget>[
                      Column(
                          children: profiles
                              .map((profile) => Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Edit Your\nProfile",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Approach",
                                            fontWeight: FontWeight.w300,
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              width: 90,
                                              height: 104,
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width: 90,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/user.png"))),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 28,
                                                        height: 28,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/btn_add_photo.png"))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _usernameController
                                          ..text = profile.username,
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                                                    BorderRadius.circular(10)),
                                            labelText: "Name",
                                            hintText: "Name"),
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
                                                    BorderRadius.circular(10)),
                                            labelText: "Email",
                                            hintText: "Email"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _phoneController
                                          ..text = profile.profilePhoneNumber
                                              .toString(),
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: "Phone Number",
                                            hintText: "Phone Number"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _placeController
                                          ..text = profile.placeOfBirth,
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: "Place Of Birth",
                                            hintText: "Place Of Birth"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _dateController
                                          ..text = profile.dateOfBirth
                                              .substring(0, 10),
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: "Date Of Birth",
                                            hintText: "Date Of Birth"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _genderController
                                          ..text = profile.gender,
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: "Gender",
                                            hintText: "Gender"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _statusController
                                          ..text = profile.status,
                                        style: blackTextFont,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: "Status",
                                            hintText: "Status"),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      isUpdateProfile
                                          ? SpinKitFadingCircle(
                                              color: Color(0XFF0061A8),
                                            )
                                          : SizedBox(
                                              width: 250,
                                              height: 45,
                                              child: RaisedButton(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Text("Update My Profile",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontFamily: "Approach",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.white)),
                                                color: Color(0XFF0061A8),
                                                onPressed: () {
                                                  setState(() {
                                                    isUpdateProfile = true;
                                                  });
                                                  _onPressed(profile.profileID);
                                                },
                                              ),
                                            ),
                                      Text(profile.profileID.toString())
                                    ],
                                  ))
                              .toList())
                    ],
                  ),
                );
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
            },
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

  _onPressed(int profileID) {
    setState(() {
      userService
          .updateProfile(_phoneController.text, _placeController.text,
              profileID.toString())
          .whenComplete(() {
        if (userService.statusProfile) {
          setState(() {
            isUpdateProfile = false;
          });
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFFFF5C83),
            message: userService.dataProfile["phoneNumber"].toString(),
          )..show(context);
        }
        if (userService.statusProfile2) {
          setState(() {
            isUpdateProfile = false;
          });
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFFFF5C83),
            message: userService.dataProfile["placeOfBirth"].toString(),
          )..show(context);
        }
        if (userService.statusProfile3) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MainPage()),
              (Route<dynamic> route) => false);
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xFFFF5C83),
            message: "Success Update Profile",
          )..show(context);
        }
      });
    });
  }
}

// class UpdateProfile extends StatelessWidget {
//   final TextEditingController _usernameController = new TextEditingController();
//   final TextEditingController _nameController = new TextEditingController();
//   final TextEditingController _emailController = new TextEditingController();
//   final TextEditingController _phoneController = new TextEditingController();
//   final TextEditingController _placeController = new TextEditingController();
//   final TextEditingController _dateController = new TextEditingController();
//   final TextEditingController _genderController = new TextEditingController();
//   final TextEditingController _statusController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     UserService userService = new UserService();
//     List gender = ["Male", "Female"];
//     String select;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           new FutureBuilder<List<UserGetProfile>>(
//             future: userService.getUserProfileList(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<UserGetProfile> profiles = snapshot.data;
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//                   child: ListView(
//                     children: <Widget>[
//                       Column(
//                           children: profiles
//                               .map((profile) => Column(
//                                     children: <Widget>[
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text("Edit Your\nProfile",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontFamily: "Approach",
//                                             fontWeight: FontWeight.w300,
//                                           )),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Container(
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 10, bottom: 10),
//                                               width: 90,
//                                               height: 104,
//                                               child: Stack(
//                                                 children: <Widget>[
//                                                   Container(
//                                                     width: 90,
//                                                     height: 90,
//                                                     decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         image: DecorationImage(
//                                                             image: AssetImage(
//                                                                 "assets/user.png"))),
//                                                   ),
//                                                   Align(
//                                                     alignment:
//                                                         Alignment.bottomCenter,
//                                                     child: GestureDetector(
//                                                       onTap: () {},
//                                                       child: Container(
//                                                         width: 28,
//                                                         height: 28,
//                                                         decoration: BoxDecoration(
//                                                             shape:
//                                                                 BoxShape.circle,
//                                                             image: DecorationImage(
//                                                                 image: AssetImage(
//                                                                     "assets/btn_add_photo.png"))),
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _usernameController
//                                           ..text = profile.username,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Username",
//                                             hintText: "Username"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _nameController
//                                           ..text = profile.name,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Name",
//                                             hintText: "Name"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _emailController
//                                           ..text = profile.email,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Email",
//                                             hintText: "Email"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _phoneController
//                                           ..text = profile.profilePhoneNumber
//                                               .toString(),
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Phone Number",
//                                             hintText: "Phone Number"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _placeController
//                                           ..text = profile.placeOfBirth,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Place Of Birth",
//                                             hintText: "Place Of Birth"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _dateController
//                                           ..text = profile.dateOfBirth
//                                               .substring(0, 10),
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Date Of Birth",
//                                             hintText: "Date Of Birth"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _genderController
//                                           ..text = profile.gender,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Gender",
//                                             hintText: "Gender"),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         controller: _statusController
//                                           ..text = profile.status,
//                                         style: blackTextFont,
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             labelText: "Status",
//                                             hintText: "Status"),
//                                       ),
//                                       SizedBox(
//                                         height: 50,
//                                       ),
//                                       SizedBox(
//                                         width: 250,
//                                         height: 45,
//                                         child: RaisedButton(
//                                           elevation: 0,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8)),
//                                           child: Text("Update My Profile",
//                                               style: TextStyle(
//                                                   fontSize: 17,
//                                                   fontFamily: "Approach",
//                                                   fontWeight: FontWeight.w300,
//                                                   color: Colors.white)),
//                                           color: Color(0XFF0061A8),
//                                           onPressed: () {

//                                           },
//                                         ),
//                                       ),
//                                       Text(profile.profileID.toString())
//                                     ],
//                                   ))
//                               .toList())
//                     ],
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return snapshot.error;
//               }
//               return new Center(
//                 child: new Column(
//                   children: <Widget>[
//                     new Padding(padding: new EdgeInsets.all(50.0)),
//                     new SpinKitFadingCircle(
//                       color: Color(0XFF0061A8),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
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

//   _onPressed(int profileID) {

//   }
// }

// class UpdateProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     UserService userService = new UserService();
//     return Container(
//         child: new FutureBuilder<List<UserProfile>>(
//             future: userService.getUserProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) print(snapshot.error);
//               return snapshot.hasData
//                   ? new ProfileList(
//                       list: snapshot.data,
//                     )
//                   : new Center(
//                       child: SpinKitFadingCircle(
//                         color: Color(0XFF0061A8),
//                       ),
//                     );
//             }));
//   }
// }

// class ProfileList extends StatelessWidget {
//   List<UserProfile> list;
//   ProfileList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView.builder(
//           itemCount: list == null ? 0 : list.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Text(
//                   list[index].url,
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }

// class _UpdateProfileState extends State<UpdateProfile> {
//   final TextEditingController _emailController = new TextEditingController();
//   UserService userService = new UserService();
//   UserAccount userAccount;
//   UserProfile userProfile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           FutureBuilder(
//             future: userService.getUser(),
//             builder: (_, snapshot) {
//               if (snapshot.hasData) {
//                 userAccount = snapshot.data;
//               }

//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//                 child: ListView(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text("Edit Your\nProfile",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: "Approach",
//                               fontWeight: FontWeight.w300,
//                             )),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         (snapshot.hasData)
//                             ? Container(
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       margin:
//                                           EdgeInsets.only(top: 22, bottom: 10),
//                                       width: 90,
//                                       height: 104,
//                                       child: Stack(
//                                         children: <Widget>[
//                                           Container(
//                                             width: 90,
//                                             height: 90,
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 image: DecorationImage(
//                                                     image: AssetImage(
//                                                         "assets/user.png"))),
//                                           ),
//                                           Align(
//                                             alignment: Alignment.bottomCenter,
//                                             child: GestureDetector(
//                                               onTap: () {},
//                                               child: Container(
//                                                 width: 28,
//                                                 height: 28,
//                                                 decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     image: DecorationImage(
//                                                         image: AssetImage(
//                                                             "assets/btn_add_photo.png"))),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                     TextField(
//                                       controller: _emailController
//                                         ..text = userAccount.email,
//                                       style: blackTextFont,
//                                       decoration: InputDecoration(
//                                         border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         labelText: "Email",
//                                         hintText: "Email",
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     SizedBox(
//                                       width: 250,
//                                       height: 45,
//                                       child: RaisedButton(
//                                         elevation: 0,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         child: Text('Update My Profile',
//                                             style: TextStyle(
//                                                 fontSize: 17,
//                                                 fontFamily: "Approach",
//                                                 fontWeight: FontWeight.w300,
//                                                 color: Colors.white)),
//                                         color: Color(0XFF0061A8),
//                                         onPressed: () {},
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             : Center(
//                                 child: SpinKitFadingCircle(
//                                   color: Color(0XFF0061A8),
//                                 ),
//                               )
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
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
// }
