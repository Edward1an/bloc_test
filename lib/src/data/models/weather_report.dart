import 'package:bloc_counter/src/domain/entities/weather_report.dart';

class WeatherReportModel extends WeatherReportEntity {
  const WeatherReportModel({
    String? id,
    String? main,
    String? description,
    String? name,
    String? temp,
    String? country,
  });

  factory WeatherReportModel.fromJson(Map<String, dynamic> json) {
    return WeatherReportModel(
      id: json['id'] ?? "",
      main: json['main'] ?? "",
      description: json['description'] ?? "",
      name: json['name'] ?? "",
      temp: json['temp'] ?? "",
      country: json['country'] ?? "",
    );
  }
}
