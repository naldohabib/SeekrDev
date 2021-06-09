part of 'widgets.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchWidget({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 12),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // border: Border.all(color: Colors.black),
            color: accentColor3.withOpacity(0.2)),
        child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'What are you looking for?',
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7), fontFamily: "Approach"),
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
            )));
  }
}
