import 'package:bloc_counter/src/data/data_sources/remote/weather_api_service.dart';
import 'package:bloc_counter/src/data/repository/weather_report_repository_impl.dart';
import 'package:bloc_counter/src/domain/repository/weather_report.repository.dart';
import 'package:bloc_counter/src/domain/usecases/get_weather_report.usecase.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<WeatherApiService>(WeatherApiService());
  sl.registerSingleton<WeatherReportRepository>(
      WeatherReportRepositoryImpl(sl()));
  sl.registerSingleton<GetWeatherReportUseCase>(GetWeatherReportUseCase(sl()));
  sl.registerFactory<RemoteWeatherReportBloc>(
      () => RemoteWeatherReportBloc(sl()));
}
