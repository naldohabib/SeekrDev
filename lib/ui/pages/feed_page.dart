part of 'pages.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  SharedPreferences sharedPreferences;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  UserService userService = new UserService();
  UserAccount userAccount;

  bool isLoggedIn = false;
  String userNameID = '';
  String userId;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("username");
    // userName = sharedPreferences.getString("username");

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
    return ListView(
      children: [
        // NOTE : HEADER
        // FutureBuilder(
        //   future: userService.getUser(),
        //   builder: (_, snapshot) {
        //     if (snapshot.hasData) {
        //       userAccount = snapshot.data;
        //     }

        //     return Container(
        //       decoration: BoxDecoration(
        //         // color: accentColor4,
        //         borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(20),
        //             bottomRight: Radius.circular(20)),
        //       ),
        //       margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 5),
        //       child: userId != null
        //           ? Container(
        //               child: (snapshot.hasData)
        //                   ? Row(
        //                       children: [
        //                         Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             SizedBox(
        //                               width: MediaQuery.of(context).size.width -
        //                                   2 * defaultMargin -
        //                                   131,
        //                               child: Text(
        //                                 "Hello,",
        //                                 style: TextStyle(
        //                                   fontSize: 18,
        //                                   fontFamily: "Approach",
        //                                 ),
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               width: MediaQuery.of(context).size.width -
        //                                   2 * defaultMargin -
        //                                   131,
        //                               child: Text(
        //                                 userAccount.username + ".",
        //                                 style: blackTextFont.copyWith(
        //                                     fontSize: 22,
        //                                     fontWeight: FontWeight.bold,
        //                                     fontFamily: "Approach"),
        //                                 maxLines: 1,
        //                                 overflow: TextOverflow.clip,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         SizedBox(
        //                           width: 16,
        //                         ),
        //                         userId != null
        //                             ? Container(
        //                                 padding: EdgeInsets.only(left: 10),
        //                                 child: Icon(
        //                                   Icons.notifications_active_outlined,
        //                                   color: Colors.black,
        //                                   size: 32.0,
        //                                 ),
        //                               )
        //                             : Container(
        //                                 child: Align(
        //                                   child: Text("Login",
        //                                       style: TextStyle(
        //                                           fontFamily: "Approach",
        //                                           fontSize: 17)),
        //                                 ),
        //                               ),
        //                         SizedBox(
        //                           width: 10,
        //                         ),
        //                         Container(
        //                           padding: EdgeInsets.all(5),
        //                           child: Stack(
        //                             children: [
        //                               Container(
        //                                   width: 50,
        //                                   height: 50,
        //                                   decoration: BoxDecoration(
        //                                       shape: BoxShape.circle,
        //                                       image: DecorationImage(
        //                                           image: AssetImage(
        //                                               "assets/user.png"),
        //                                           fit: BoxFit.cover)))
        //                             ],
        //                           ),
        //                         ),
        //                       ],
        //                     )
        //                   : SpinKitFadingCircle(
        //                       color: Color(0XFF0061A8),
        //                     ),
        //             )
        //           : Container(
        //               decoration: BoxDecoration(
        //                 // color: accentColor4,
        //                 borderRadius: BorderRadius.only(
        //                     bottomLeft: Radius.circular(20),
        //                     bottomRight: Radius.circular(20)),
        //               ),
        //               // margin: EdgeInsets.fromLTRB(
        //               //     defaultMargin, 20, defaultMargin, 5),
        //               child: Row(
        //                 children: [
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     // mainAxisAlignment: MainAxisAlignment.end,
        //                     children: [
        //                       SizedBox(
        //                         width: MediaQuery.of(context).size.width -
        //                             2 * defaultMargin -
        //                             131,
        //                         child: Text(
        //                           "Hello,",
        //                           style: TextStyle(
        //                             fontSize: 18,
        //                             fontFamily: "Approach",
        //                           ),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         width: MediaQuery.of(context).size.width -
        //                             2 * defaultMargin -
        //                             131,
        //                         child: Text(
        //                           'Guest.',
        //                           style: blackTextFont.copyWith(
        //                               fontSize: 22,
        //                               fontWeight: FontWeight.bold,
        //                               fontFamily: "Approach"),
        //                           maxLines: 1,
        //                           overflow: TextOverflow.clip,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     width: 16,
        //                   ),
        //                   Container(
        //                     child: Align(
        //                       child: Text("Login",
        //                           style: TextStyle(
        //                               fontFamily: "Approach", fontSize: 17)),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.all(5),
        //                     child: Stack(
        //                       children: [
        //                         Container(
        //                             width: 50,
        //                             height: 50,
        //                             decoration: BoxDecoration(
        //                                 shape: BoxShape.circle,
        //                                 image: DecorationImage(
        //                                     image:
        //                                         AssetImage("assets/user.png"),
        //                                     fit: BoxFit.cover)))
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //     );
        //   },
        // ),

        // NOTE : SEARCH
        SearchWidget(
          onChanged: (value) {},
        ),

        // NOTE : FEATURE CHALLANGE
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 12),
          child: Text(
            "Featured Challange",
            style: blackTextFont.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Approach"),
          ),
        ),
        FeaturedChallenge(),

        // NOTE : LIST CATEGORY ITEM QUIS
        Container(
            // margin: EdgeInsets.only(
            //     left: defaultMargin, right: defaultMargin, bottom: 12),
            ),
        ListCategoryChallange(),

        // NOTE : MARGIN BOTTOM SCREEN
        SizedBox(height: 20),
      ],
    );
  }
}
