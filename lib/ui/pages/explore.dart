part of 'pages.dart';

class ExplorePage extends StatelessWidget {   
  UserService userService = new UserService();
  UserAccount userAccount;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Seekr",
                  ),
                  content: Text("You Can't Go Back At This Stage ?"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MainPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(  
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: FutureBuilder(
        future: userService.getUser(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            userAccount = snapshot.data;
          }

          return Scaffold(
            // body: Container(
            //     child: Center(
            //   child: (snapshot.hasData)
            //       ? Text(userAccount.username)
            //       : Text('null'),
            // )),
            body: Column(
              children: [
                (snapshot.hasData) ? Text(userAccount.username) : Text('null'),
                (snapshot.hasData) ? Text(userAccount.id.toString()) : Text('null'),
              ],
            ),
          );
        },
      ),
    );
  }
}
