import 'dart:convert';

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
    final current = json['current'] as Map<String, dynamic>;
    final weather = (current['weather'] as List).first as Map<String, dynamic>;
    return WeatherReportModel(
      id: weather['id'].toString(),
      main: weather['main'] ?? "",
      description: weather['description'] ?? "",
      name: json['timezone'] ?? "",
      temp: current['temp'].toString(),
      country: json['country'] ?? "",
    );
  }
}
