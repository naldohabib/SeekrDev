part of 'pages.dart';

// ignore: must_be_immutable
class ChallengeDetailsPage extends StatelessWidget {
  List<Movie> list;
  int index;
  ChallengeDetailsPage({this.index, this.list});

  @override
  Widget build(BuildContext context) {
    ChallengesHelper challengesHelper = new ChallengesHelper();
    MovieDetails movieDetails;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (route) => false),
        child: FutureBuilder(
            future: challengesHelper.getDetails(list[index]),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                movieDetails = snapshot.data;
              }

              return Scaffold(
                  backgroundColor: Color(0xFFe5e5e5),
                  body: SafeArea(
                    child: SlidingUpPanel(
                      backdropEnabled: true,
                      minHeight: MediaQuery.of(context).size.height - 170,
                      maxHeight: MediaQuery.of(context).size.height - 70,
                      panelBuilder: (scrollController) => buildSlidingPanel(
                          scrollController: scrollController,
                          movieDetails: snapshot.data),
                      body: Stack(
                        children: [
                          // NOTE : BACKGROUND CHALLENGES
                          Positioned.fill(
                              bottom: MediaQuery.of(context).size.height * 0.1,
                              child: Container(
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: list[index].image == null
                                        ? AssetImage('assets/bgg1.png')
                                        : NetworkImage(list[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: new BackdropFilter(
                                  filter: new ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.white.withOpacity(0.0)),
                                  ),
                                ),
                              )
                              // Image.asset('assets/bgg1.png', fit: BoxFit.cover)
                              ),

                          // : BUTTON BACK
                          Positioned(
                              left: 20,
                              top: 20,
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()),
                                  );
                                },
                                child:
                                    Icon(Icons.arrow_back, color: Colors.black),
                                backgroundColor: Colors.white,
                              )),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }

  buildSlidingPanel({ScrollController scrollController, movieDetails}) =>
      (movieDetails != null
          ? ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].title,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Approach",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("by " + list[index].challengeMaker,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Approach",
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 20),
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    // color: Colors.grey.withOpacity(0.4)
                                    color: Color(0XFFC83639)),
                                // color: Colors.grey,
                                child:
                                    // NOTE : NEW
                                    Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Center(
                                        child: Text(
                                          // 'REWARD IDR ${list[index].reward}',
                                          'REWARD ${NumberFormat.currency(locale: 'id').format(list[index].rewardInt)}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "Approach",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                // NOTE : OLD
                                // Center(
                                //   child: Text(
                                //     // 'REWARD IDR ${list[index].reward}',
                                //     'REWARD ${NumberFormat.currency(locale: 'id').format(list[index].rewardInt)}',
                                //     style: TextStyle(
                                //         fontSize: 16,
                                //         fontFamily: "Approach",
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // )
                                ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  "Date / Time",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Approach",
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 71.0,
                                ),
                                Flexible(
                                    child: Text(
                                        // movieDetails.startedAt
                                        //     .toLocal()
                                        //     .toString(),
                                        movieDetails.startedAt.substring(0, 10),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Approach",
                                        ))),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Tasks",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Approach",
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 112.0,
                                ),
                                Flexible(
                                  child: Text(list[index].taskCount.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "Approach",
                                      )),
                                ),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DESCRIPTION",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Approach",
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                ),
                                Container(
                                    child:
                                        // (snapshot.hasData) ?
                                        Text(movieDetails.description,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontFamily: "Approach",
                                            ))
                                    // : SizedBox(
                                    //     height: 50,
                                    //     width: 50,
                                    //     child: Text("NO DATA"),
                                    //   ),
                                    ),
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
                            Container(
                              // margin: EdgeInsets.only(
                              //   top: 15,
                              // ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RULES",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Approach",
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                  ),
                                  Container(
                                      child:
                                          // (snapshot.hasData) ?
                                          Text(movieDetails.challengeRule,
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontFamily: "Approach",
                                              ))
                                      // : SizedBox(
                                      //     height: 50,
                                      //     width: 50,
                                      //     child: Text("NO DATA"),
                                      //   ),
                                      ),
                                ],
                              ),
                            ),
                            // NOTE : BOTTOM QUIS
                            Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: CustomButton(
                                list: list,
                                index: index,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : SpinKitFadingCircle(color: Color(0XFF0061A8)));
}
