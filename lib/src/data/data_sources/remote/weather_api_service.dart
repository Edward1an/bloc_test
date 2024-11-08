import 'package:bloc_counter/env.dart';

import 'package:http/http.dart';

class WeatherApiService {
  final String _baseUrl = EnvConfig.BASE_URL;

  Future<Response> getWeatherReports(String apiKey) async {
    final String url =
        "$_baseUrl?lat=34&lon=34&exclude=hourly,daily,minutely&appid=$apiKey";
    return get(Uri.parse(url));
  }
}
