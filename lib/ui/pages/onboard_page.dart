part of 'pages.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final PageBloc _pageBloc = PageBloc();
  int currentIndex = 0;
  PageController _controller;
  var result;

  @override
  void initState() {
    // _pageBloc.add(GoToOnboardPage());
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contenst.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  // padding: const EdgeInsets.all(40),
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        child: Image(
                          image: AssetImage(
                            contenst[i].image,
                          ),
                          // height: 300,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        contenst[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: "Approach",
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFA663B)),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contenst[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Approach",
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contenst.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
              height: 50,
              // margin: EdgeInsets.all(40),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                    currentIndex == contenst.length - 1 ? "Continue" : "Next"),
                onPressed: () {
                  if (currentIndex == contenst.length - 1) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MainPage(),
                        ));
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                // color: Color(0xFFF48B29),
                color: Color(0xFFFF5713),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ))
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xFFF48B29),
        color: Color(0xFFFF5713),
      ),
    );
  }
}
