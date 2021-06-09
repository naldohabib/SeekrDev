part of 'services.dart';

class UserService {
  var status;
  var status2;
  var data;

  // NOTE : YANG LAMA
  Future<UserAccount> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url = "https://bismillah-seekr.herokuapp.com/auth/users/me/";

    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    var data = json.decode(response.body);
    // print(data);

    String email = (data as Map<String, dynamic>)['email'].toString();
    int id = (data as Map<String, dynamic>)['id'];
    String username = (data as Map<String, dynamic>)['username'].toString();

    return UserAccount(
      email: email,
      id: id,
      username: username,
    );
  }

  // NOTE : NEW
  // Future<List<UserAccount>> getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'access';
  //   final value = prefs.get(key) ?? 0;

  //   String url = "https://bismillah-seekr.herokuapp.com/api/app-users/user/me";

  //   http.Response response = await http.get(Uri.parse(url), headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   });

  //   var data = json.decode(response.body);
  //   List result = data['results'];
  //   // print(result);

  //   return result.map((e) => UserAccount.fromJson(e)).toList();
  // }

  Future<List<UserGetProfile>> getUserProfileList() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url = "https://bismillah-seekr.herokuapp.com/api/app-users/user/me";

    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    var data = json.decode(response.body);
    List result = data['results'];
    // print(result);

    return result.map((e) => UserGetProfile.fromJson(e)).toList();
  }

  Future<void> updateAccount(String username, String idAccount,
      {int iD}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        // ignore: unnecessary_brace_in_string_interps
        "https://bismillah-seekr.herokuapp.com/api-dev/app-users/user/${idAccount ?? iD}/";

    http.Response response = await http.put(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "username": "$username"
    });

    status = response.body.contains('username');
    status2 = response.body.contains('url');

    data = json.decode(response.body);
    // print(data);

    if (status) {
      print('username : ${data["username"]}');
    }
    if (status2) {
      print('url : ${data["url"]}');
    }

    // if (status) {
    //   if (data["username"] ==
    //           'Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters.' ||
    //       data["username"] == 'This field may not be blank.' ||
    //       data["username"] == 'A user with that username already exists.') {
    //     print('username : ${data["username"]}');
    //   } else {
    //       print('username : ${data["username"]}');
    //   }
    //   // else if (!(
    //   //     data["username"] !=
    //   //         'Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters.' ||
    //   //     data["username"] != 'This field may not be blank.' ||
    //   //     data["username"] != 'A user with that username already exists.')
    //   // ) {
    //   //   print('username : ${data["username"]}');
    //   // }
    // }
  }

  Future<List<UserProfile>> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        "https://bismillah-seekr.herokuapp.com/api/app-users/user-profile";

    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    var data = json.decode(response.body);
    return (data['results'] as List)
        .map((e) => UserProfile.fromJson(e))
        .toList();
  }

  updateUserProfile(
      String phoneNumber, String placeOfBirth, String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        "https://bismillah-seekr.herokuapp.com/api/app-users/user-profile";

    http.Response response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "phoneNumber": "$phoneNumber",
      "placeOfBirth": "$placeOfBirth",
      "imagePath": "$imagePath"
    });

    var data = json.decode(response.body);
    print(data);
  }

  // Future<UserProfileExt> getProfile({UserProfile userProfile}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'access';
  //   final value = prefs.get(key) ?? 0;

  //   String url =
  //       "https://bismillah-seekr.herokuapp.com/api-dev/app-users/user-profile/${userProfile.id}/";

  //   http.Response response = await http.get(Uri.parse(url), headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   });

  //   var data = json.decode(response.body);
  //   print(data);

  //   int idUser = (data as Map<String, dynamic>)['id'];
  //   String gender = (data as Map<String, dynamic>)['gender'].toString();

  //   return UserProfileExt(UserProfile.fromJson(data), id: idUser);
  // }

  // Future<UserProfileExt> updateProfile(UserProfile userProfile,
  //     {int id}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'access';
  //   final value = prefs.get(key) ?? 0;

  //   String url =
  //       "https://bismillah-seekr.herokuapp.com/api-dev/app-users/user-profile/${id ?? userProfile.id}/";

  //   http.Response response = await http.put(
  //     Uri.parse(url),
  //     headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
  //     // body: {
  //     //   // "image": "$image"
  //     // }
  //   );

  //   var data = json.decode(response.body);
  //   print(data);

  //   String gender = (data as Map<String, dynamic>)['gender'].toString();

  //   return id != null
  //       ? UserProfileExt(UserProfile.fromJson(data), gender: gender)
  //       : UserProfileExt(userProfile, gender: gender);
  // }
}
