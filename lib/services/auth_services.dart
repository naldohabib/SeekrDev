part of 'services.dart';

class DatabaseHelper {
  final serverUrlLog =
      Uri.parse("https://bismillah-seekr.herokuapp.com/auth/jwt/create/");
  final serverUrlReg =
      Uri.parse("https://bismillah-seekr.herokuapp.com/auth/users/");

  var status;
  var status2;
  var status3;
  var status4;
  var data;
  var access;

  loginData(String username, String password) async {
    final response = await http.post(serverUrlLog,
        headers: {'Accept': 'application/json'},
        body: {"username": "$username", "password": "$password"});
    status = response.body.contains('detail');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["detail"]}');
    } else {
      print('data : ${data["access"]}');
      print('data : $username');
      // _save(data["access"]); //NOTE: GET TOKEN USER
      // _save(username); //NOTE: GET NAME USER
      _save(data["access"], "$username");
    }
  }

  Future<Register> registerData(
      String username, String email, String password) async {
    // String myUrl = "$serverUrlReg";
    final response = await http.post(serverUrlReg, headers: {
      'Accept': 'application/json'
    }, body: {
      "username": "$username",
      "email": "$email",
      "password": "$password"
    });
    status2 = response.body.contains('username');
    status3 = response.body.contains('password');
    status4 = response.body.contains('id');

    data = json.decode(response.body);

    if (status2) {
      print('username : ${data["username"]}');
    }
    if (status3) {
      // print('password : ${data["id"]}');
      print('password : ${data["password"]}');
    }
    if (status4) {
      print('id : ${data["id"]}');
      _save2(data["id"]);
    }

    String user = (data as Map<String, dynamic>)['username'].toString();
    int id = (data as Map<String, dynamic>)['id'];

    return Register(username: user, id: id);
  }

  _save(String access, String username) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = access;
    final key2 = 'username';
    final value2 = username;
    prefs.setString(key, value);
    prefs.setString(key2, value2);
  }

  _save2(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = id;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}

class SignInSignUpResult {
  final String message;
  var user;

  SignInSignUpResult({this.message, this.user});
}
