part of 'widgets.dart';

class FeaturedChallenge extends StatelessWidget {
  // final Function onTap;

  // FeaturedChallenge({this.onTap});

  @override
  Widget build(BuildContext context) {
    ChallengesHelper challengesHelper = new ChallengesHelper();
    return Container(
        height: 260,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
        // margin: EdgeInsets.symmetric(vertical: defaultMargin ),
        // color: Colors.blue,
        child: new FutureBuilder<List<Movie>>(
            future: challengesHelper.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ChallengeList(
                      list: snapshot.data,
                    )
                  : new Center(
                      child: SpinKitFadingCircle(
                        color: Color(0XFF0061A8),
                      ),
                    );
            }));
  }
}

class ChallengeList extends StatelessWidget {
  List<Movie> list;
  ChallengeList({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list == null ? 0 : list.length,
          // itemCount: list?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChallengeDetailsPage(
                    list: list,
                    index: index,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: 270.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border.all(color: Colors.black)
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 5.0,
                      child: Container(
                        height: 60.0,
                        width: 270.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // '${challenges.nameChallenge}',
                                    "Dimulai",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Approach",
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    // "22 Okt 2021",
                                    // list[index].startedAt.toLocal().toString(),
                                    list[index].startedAt.substring(0, 10),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Approach"),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Hadiah",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Approach",
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    // "20.000.000",
                                    NumberFormat.currency(locale: 'id')
                                        .format(list[index].rewardInt),
                                    // list[index].reward, //NOTE: STRING
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Approach"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0)
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            // borderRadius: BorderRadius.circular(10.0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            child: Image(
                              height: 180.0,
                              width: 270.0,
                              image: list[index].image == null
                                  ? AssetImage("assets/bgg1.png")
                                  : NetworkImage(list[index].image),
                              // AssetImage("assets/bgg1.png"),
                              // NOTE : IMAGE URL!
                              // NetworkImage(
                              //     list[index].image),
                              // image: AssetImage(challenge.cardElementTop),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[index].title.substring(0, 12),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Approach",
                                      letterSpacing: 1.2,
                                    )),
                                Text(list[index].challengeMaker,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Approach"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          // Positioned(
                          //     right: 18,
                          //     top: 15,
                          //     child: Image.asset("assets/icon_type_wifi.png"),
                          //     // child: Image.asset(challenge.type),
                          //     width: 22,
                          //     height: 22),
                          Positioned(
                              left: 18,
                              top: 15,
                              child: Image.asset("assets/ellips.png"),
                              // child: Image.asset(challenge.ellips),
                              width: 22,
                              height: 22)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
