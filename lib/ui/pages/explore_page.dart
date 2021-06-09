part of 'pages.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final List<String> _listItemMaker = [
    'assets/see1.png',
    'assets/see2.png',
    'assets/see3.png',
    'assets/see3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
        children: [
          SizedBox(height: 15.0),
          Text(
            'Categories',
            style: TextStyle(
                fontFamily: "Approach",
                fontSize: 32.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0XFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0XFFCDCDCD),
            tabs: [
              Tab(
                child: Text(
                  'Seekr',
                  style: TextStyle(fontFamily: "Approach", fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'Partner',
                  style: TextStyle(fontFamily: "Approach", fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'User',
                  style: TextStyle(fontFamily: "Approach", fontSize: 18.0),
                ),
              )
            ],
          ),

          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                ListCategory(),
                ListCategory(),
                ListCategory(),
              ]))
          // ListCategory(),
        ]);
  }
}
