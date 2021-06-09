part of 'services.dart';

class UserBalanceService {
  Future<List<UserBalance>> getUserBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url = "https://bismillah-seekr.herokuapp.com/api/app-wallets/wallet";

    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    var data = json.decode(response.body);
    List result = data['results'];
    // print(result);

    return result.map((e) => UserBalance.fromJson(e)).toList();
  }
}
