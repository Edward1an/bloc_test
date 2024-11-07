import 'dart:convert';

import 'package:bloc_counter/core/resources/data_state.dart';
import 'package:bloc_counter/env.dart';
import 'package:bloc_counter/src/data/data_sources/remote/weather_api_service.dart';
import 'package:bloc_counter/src/data/models/weather_report.dart';

import 'package:bloc_counter/src/domain/repository/weather_report.repository.dart';

class WeatherReportRepositoryImpl implements WeatherReportRepository {
  final WeatherApiService _weatherApiService;

  WeatherReportRepositoryImpl(this._weatherApiService);

  final String _apiKey = EnvConfig.API_KEY;
  @override
  Future<DataState<WeatherReportModel>> getWeatherReport() async {
    final httpResponse = await _weatherApiService.getWeatherReports(
      _apiKey
    );
    if(httpResponse.statusCode >= 200){
      final json = jsonDecode(httpResponse.body);
      final data = WeatherReportModel.fromJson(json);
      return DataSuccess(data);
    } else{
      return DataFailed(httpResponse);
    }
  }
}
