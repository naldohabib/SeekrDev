part of 'widgets.dart';

class ListCategoryChallange extends StatefulWidget {
  @override
  _ListCategoryChallangeState createState() => _ListCategoryChallangeState();
}

class _ListCategoryChallangeState extends State<ListCategoryChallange>
    with SingleTickerProviderStateMixin {
  ChallengesHelper challengesHelper = new ChallengesHelper();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.0),
        Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: _tabController,
                    labelPadding: EdgeInsets.only(right: 10, left: 10),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0XFF0061A8)),
                    tabs: [
                      Tab(
                        child: Container(
                          // height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Color(0XFF0061A8))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("SEEKR",
                                style: TextStyle(fontFamily: "Approach")),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Color(0XFF0061A8))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("PARTNER",
                                style: TextStyle(fontFamily: "Approach")),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Color(0XFF0061A8), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("IS FEATURED",
                                style: TextStyle(fontFamily: "Approach")),
                          ),
                        ),
                      ),
                    ]),
              ],
            )),
        Container(
            // height: MediaQuery.of(context).size.height - 50.0,
            height: 260,
            width: double.infinity,
            child: TabBarView(controller: _tabController, children: [
              FeaturedChallengeBySeekr(),
              FeaturedChallengeByPartner(),
              FeaturedChallengeIsFeatured(),
              // ListCategory(),
              // ListCategory(),
            ]))
      ],
    );
  }
}
