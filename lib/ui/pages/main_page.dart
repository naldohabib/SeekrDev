part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;

  MainPage({Key key, this.bottomNavBarIndex = 0, this.isExpired = false})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences sharedPreferences;
  int bottomNavBarIndex = 0;
  PageController pageController;
  String userNameID = '';
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String userId = sharedPreferences.getString("access");

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
    return Scaffold(
        body: Stack(
          children: [
            // Container(color: accentColor4),
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: [
                FeedPage(),
                Center(
                    child: Text(
                  'Notif In Proces!',
                  style: TextStyle(fontFamily: "Approach"),
                )),
                // Center(
                //     child: Text('Explore In Proces!',
                //         style: TextStyle(fontFamily: "Approach"))),
                // ExplorePage(),
                ProfilePage(),  
                // Center(
                //     child: Text('Setting In Proces!',
                //         style: TextStyle(fontFamily: "Approach"))),
              ],
            ),
          ],
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            //// sets the background color of the `BottomNavigationBar`
            // canvasColor: Color(0XFFFFFFFF).withOpacity(0.8),
            canvasColor: accentColor4,

            //// sets the active color of the `BottomNavigationBar` if `Brightness` is light
            // primaryColor: Colors.red,
            // textTheme: Theme.of(context)
            //     .textTheme
            //     .copyWith(caption: new TextStyle(color: Colors.yellow))),
          ),
          child: BottomNavigationBar(
            currentIndex: bottomNavBarIndex,
            onTap: onTabTapped,
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color(0XFFE5E5E5),
            // backgroundColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text(
                    "Feed",
                    style: TextStyle(fontSize: 12, fontFamily: "Approach"),
                    // style: GoogleFonts.raleway(
                    //     fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  title: Text(
                    "Notif",
                    style: TextStyle(fontSize: 12, fontFamily: "Approach"),
                  )),
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.explore,
              //     ),
              //     title: Text(
              //       "Explore",
              //       style: TextStyle(fontSize: 12, fontFamily: "Approach"),
              //     )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 12, fontFamily: "Approach"),
                  )),
            ],
          ),
        ));
  }

  void onTabTapped(int index) {
    this.pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }
}
