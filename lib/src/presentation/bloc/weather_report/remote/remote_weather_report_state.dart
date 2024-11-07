import 'package:bloc_counter/src/domain/entities/weather_report.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class RemoteWeatherReportState extends Equatable{
  final WeatherReportEntity? weatherReport;
  final Response? response;
  const RemoteWeatherReportState({this.response, this.weatherReport});

  @override
  List<Object?> get props => [weatherReport!, response!];
}

class RemoteWeatherReportLoading extends RemoteWeatherReportState{
  const RemoteWeatherReportLoading();
}

class RemoteWeatherReportDone extends RemoteWeatherReportState{
  const RemoteWeatherReportDone(WeatherReportEntity weatherReport): super(weatherReport: weatherReport);
}

class RemoteWeatherReportError extends RemoteWeatherReportState{
  const RemoteWeatherReportError(Response response): super(response: response);
}