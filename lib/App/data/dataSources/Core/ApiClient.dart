import 'dart:convert';

//* Http
import 'package:http/http.dart';
import 'package:movie_app_tmdb/App/Core/errors/Custome_Error.dart';

//* Api Info
import 'package:movie_app_tmdb/App/data/api/ApiInfo/ApiConstants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? param}) async {
    Uri _url =await Uri.parse(await getPath(path, param));

    final response =
        await _client.get(_url, headers: {"Content-Type": 'application/json'});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw CustomException(
          message: response.reasonPhrase!, statusCode: response.statusCode);
    }
    //*================ // ============
  }

  String getPath(String path, Map? param) {
    var paramString = "";
    if (param != null) {
      param.forEach((key, value) {
        paramString += "&$key=$value";
      });
    }

    return "${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramString";
  }
}
