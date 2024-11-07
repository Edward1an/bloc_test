import 'package:bloc_counter/core/resources/data_state.dart';
import 'package:bloc_counter/core/usecase/usecase.dart';
import 'package:bloc_counter/src/domain/entities/weather_report.dart';
import 'package:bloc_counter/src/domain/repository/weather_report.repository.dart';

class GetWeatherReportUseCase
    implements UseCase<DataState<WeatherReportEntity>, void> {
  final WeatherReportRepository _weatherReportRepository;

  GetWeatherReportUseCase(
    this._weatherReportRepository);

  @override
  Future<DataState<WeatherReportEntity>> call({params}) {
    return _weatherReportRepository.getWeatherReport();
  }
}
