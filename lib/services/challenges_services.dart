part of 'services.dart';

class ChallengesHelper {
  // NOTE : GET DATA CHALLENGES
  Future<List<Movie>> getData() async {
    final serverUrl3 = Uri.parse(
        "https://bismillah-seekr.herokuapp.com/api-public/app-challenges/challenge");
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'access';
    // final value = prefs.get(key) ?? 0;

    // String myUrl = "$serverUrl3";
    http.Response response = await http.get(serverUrl3, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
    });
    var data = json.decode(response.body);      
    List result = data['results'];
    // print(result);

    return result.map((e) => Movie.fromJson(e)).toList();  
    // return json.decode(response.body);         
  }

  // NOTE : GET DETAIL CHALLENGES
  Future<MovieDetails> getDetails(Movie movie, {int id}) async {   
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;

    String url =
        // ignore: unnecessary_brace_in_string_interps
        "https://bismillah-seekr.herokuapp.com/api/app-challenges/challenge/${id ?? movie.id}";

    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
    });  

    var data = json.decode(response.body);
    // print(data);

    // return data.map((e) => MovieDetails.fromJson(e)).toList();

    String description =
        (data as Map<String, dynamic>)['description'].toString();
    String user = (data as Map<String, dynamic>)['user'].toString();
    String difficultyLevel =
        (data as Map<String, dynamic>)['difficultyLevel'].toString();
    String types = (data as Map<String, dynamic>)['types'].toString();
    String startedAt = (data as Map<String, dynamic>)['startedAt'].toString();
    String finishedAt = (data as Map<String, dynamic>)['finishedAt'].toString();
    String participantCount =
        (data as Map<String, dynamic>)['participantCount'].toString();
    String challengeRuleHeadline =
        (data as Map<String, dynamic>)['challengeRuleHeadline'].toString();
    // String challengeRuleDescription =
    //     (data as Map<String, dynamic>)['challengeRuleDescription'].toString();
    String challengeRule = (data as Map<String, dynamic>)['challengeRule']
            ['description']
        .toString();
    bool isAvailable = (data as Map<String, dynamic>)['isAvailable'];
    int taskCount = (data as Map<String, dynamic>)['taskCount'];
    bool isCompleted = (data as Map<String, dynamic>)['isCompleted'];
    // print(movieId);

    return id != null
        ? MovieDetails(Movie.fromJson(data),
            user: user,
            description: description,
            difficultyLevel: difficultyLevel,
            types: types,
            // startedAt: DateTime.parse(startedAt),
            startedAt: startedAt,
            finishedAt: finishedAt,
            participantCount: participantCount,
            challengeRuleHeadline: challengeRuleHeadline,
            challengeRule: challengeRule,
            isAvailable: isAvailable,
            taskCount: taskCount,
            isCompleted: isCompleted
            // challengeRuleDescription: challengeRuleDescription,
            )
        : MovieDetails(movie,
            user: user,
            description: description,
            difficultyLevel: difficultyLevel,
            types: types,
            // startedAt: DateTime.parse(startedAt),
            startedAt: startedAt,
            finishedAt: finishedAt,
            participantCount: participantCount,
            challengeRuleHeadline: challengeRuleHeadline,
            challengeRule: challengeRule,
            isAvailable: isAvailable,
            taskCount: taskCount,
            isCompleted: isCompleted
            // challengeRuleDescription: challengeRuleDescription,
            );

    // List description = (data as Map<String, dynamic>)['description'];
  }

  // NOTE : GET CATEGORY CHALLENGES
  Future<List<ChallengeCategory>> getDataCategory() async {
    final serverUrlCategory = Uri.parse(
        "https://bismillah-seekr.herokuapp.com/api-public/app-challenges/challenge/list-of-challengeMaker");

    http.Response response = await http.get(serverUrlCategory, headers: {
      'Accept': 'application/json',
    });

    var data = json.decode(response.body);
    List result = data['result'];
    // print(result);

    return result.map((e) => ChallengeCategory.fromJson(e)).toList();
  }

  // NOTE : GET CHALLENGE BY SEEKR
  Future<List<Movie>> getDataSeekr() async {
    final serverUrLBySeekr = Uri.parse(
        "https://bismillah-seekr.herokuapp.com/api/app-challenges/challenge?isFilter=True&challengeMaker=SEEKR");

    // final prefs = await SharedPreferences.getInstance();
    // final key = 'access';
    // final value = prefs.get(key) ?? 0;

    // String myUrl = "$serverUrl3";
    http.Response response = await http.get(serverUrLBySeekr, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
    });
    var data = json.decode(response.body);
    List result = data['results'];
    // print(result);

    return result.map((e) => Movie.fromJson(e)).toList();
    // return json.decode(response.body);
  }

  // NOTE : GET CHALLENGE BY PARTNER
  Future<List<Movie>> getDataPartner() async {
    final serverUrLByPartner = Uri.parse(
        "https://bismillah-seekr.herokuapp.com/api/app-challenges/challenge?isFilter=True&challengeMaker=PARTNER");

    // final prefs = await SharedPreferences.getInstance();
    // final key = 'access';
    // final value = prefs.get(key) ?? 0;

    // String myUrl = "$serverUrl3";
    http.Response response = await http.get(serverUrLByPartner, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
    });
    var data = json.decode(response.body);
    List result = data['results'];
    // print(result);

    return result.map((e) => Movie.fromJson(e)).toList();
    // return json.decode(response.body);
  }

  // NOTE : GET CHALLENGE IS FEATURED
  Future<List<Movie>> getDataIsFeatured() async {
    final serverUrLIsFeatured = Uri.parse(
        "https://bismillah-seekr.herokuapp.com/api-public/app-challenges/challenge?isFilter=True&isFeatured=True");

    // final prefs = await SharedPreferences.getInstance();
    // final key = 'access';
    // final value = prefs.get(key) ?? 0;

    // String myUrl = "$serverUrl3";
    http.Response response = await http.get(serverUrLIsFeatured, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
    });
    var data = json.decode(response.body);
    List result = data['results'];
    // print(result);

    return result.map((e) => Movie.fromJson(e)).toList();
    // return json.decode(response.body);
  }
}
