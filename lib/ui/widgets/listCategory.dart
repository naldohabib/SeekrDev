part of 'widgets.dart';

class ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
              padding:
                  EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 10),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: [
                  buildCard2("name", "1000", context),
                  buildCard2("name1", "100", context),
                  buildCard2("name1", "100", context),
                  buildCard2("name1", "100", context),
                ],
              ))
        ],
      ),
    );
  }
}

Widget buildCard2(String name, String price, context) {
  return Padding(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, right: 5.0, left: 5.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
      ),
    ),
  );
}
