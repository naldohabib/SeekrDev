part of 'widgets.dart';

class CategoryChallange extends StatefulWidget {
  @override
  _CategoryChallangeState createState() => _CategoryChallangeState();
}

class _CategoryChallangeState extends State<CategoryChallange> {
  ChallengesHelper challengesHelper = new ChallengesHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultMargin / 2),
      height: 40,
      child: new FutureBuilder<List<ChallengeCategory>>(
          future: challengesHelper.getDataCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ChallengeCategoryList(
                    categoryChallengeList: snapshot.data,
                  )
                : new Center(
                    child: SpinKitFadingCircle(
                      color: mainColor,
                    ),
                  );
          }),
    );
  }
}

// ignore: must_be_immutable
class ChallengeCategoryList extends StatefulWidget {
  List<ChallengeCategory> categoryChallengeList;
  ChallengeCategoryList({this.categoryChallengeList});

  @override
  _ChallengeCategoryListState createState() => _ChallengeCategoryListState();
}

class _ChallengeCategoryListState extends State<ChallengeCategoryList> {
  int selectedCategoryBox = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          itemCount:
              widget.categoryChallengeList == null ? 0 : widget.categoryChallengeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryBox = index;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      left: defaultMargin,
                      right: index == widget.categoryChallengeList.length - 1
                          ? defaultMargin
                          : 0),
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  decoration: BoxDecoration(
                      color: index == selectedCategoryBox
                          ? Colors.black
                          : Color(0XFFE5E5E5).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Text(
                    widget.categoryChallengeList[index].key,
                    style: TextStyle(
                      fontFamily: "Approach",
                      color: index == selectedCategoryBox
                          ? Colors.white
                          : Colors.black,
                    ),
                  )),
            );
          }),
    );
  }
}



