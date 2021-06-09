part of 'widgets.dart';

class CategoryTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Movie> list;
    return Column(
      children: [
        Container(
          height: 300,
          margin: EdgeInsets.symmetric(vertical: defaultMargin / 2),
          child: ScrollableListTabView(
            tabHeight: 55,
            bodyAnimationDuration: const Duration(milliseconds: 150),
            tabAnimationCurve: Curves.easeOut,
            tabAnimationDuration: const Duration(milliseconds: 200),
            tabs: [
              ScrollableListTab(
                  tab: ListTab(
                      label: Text('Seekr'),
                      // icon: Icon(Icons.group),
                      showIconOnList: false),
                  body: 
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list == null ? 0 : list.length,
                    itemBuilder: (_, index) => ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text(list[index].challengeMaker),
                    ),
                  )
                  ),
              ScrollableListTab(
                  tab: ListTab(
                    label: Text('Tokopedia'),
                    // icon: Icon(Icons.subject)
                  ),
                  body: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) => Card(
                      child: Center(child: Text('Card element $index')),
                    ),
                  )),
              ScrollableListTab(
                  tab: ListTab(
                      label: Text('Label 3'),
                      // icon: Icon(Icons.subject),
                      showIconOnList: true),
                  body: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) => Card(
                      child: Center(child: Text('Card element $index')),
                    ),
                  )),
              ScrollableListTab(
                  tab: ListTab(
                    label: Text('Label 4'),
                    // icon: Icon(Icons.add)
                  ),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) => ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text('List element $index'),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  _getDataChallenge() {
    ChallengesHelper challengesHelper = new ChallengesHelper();
    new FutureBuilder<List<Movie>>(
        future: challengesHelper.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ChallengeListItem(
                  list: snapshot.data,
                )
              : new Center(
                  child: SpinKitFadingCircle(
                    color: mainColor,
                  ),
                );
        });
  }
}

// ignore: must_be_immutable
class ChallengeListItem extends StatelessWidget {
  List<Movie> list;
  ChallengeListItem({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (_, index) => ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                alignment: Alignment.center,
                child: Text(index.toString()),
              ),
              title: Text(list[index].challengeMaker,
                  style:
                      TextStyle(color: Colors.white, fontFamily: "Approach")),
            ));
  }
}
