import 'package:bloc_counter/core/resources/data_state.dart';
import 'package:bloc_counter/src/domain/entities/weather_report.dart';

abstract class WeatherReportRepository {
  external Future<DataState<WeatherReportEntity>> getWeatherReport();
}
