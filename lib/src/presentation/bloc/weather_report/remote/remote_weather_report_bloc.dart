import 'package:bloc_counter/core/resources/data_state.dart';
import 'package:bloc_counter/src/domain/usecases/get_weather_report.usecase.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_event.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteWeatherReportBloc extends Bloc<RemoteWeatherReportEvent, RemoteWeatherReportState>{

  final GetWeatherReportUseCase _getWeatherReportUseCase;
  RemoteWeatherReportBloc(this._getWeatherReportUseCase): super(const RemoteWeatherReportLoading()){
    on <GetWeatherReport> (onGetWeatherReport);
  }


  void onGetWeatherReport(GetWeatherReport event, Emitter<RemoteWeatherReportState> state )async{
    final dataState = await _getWeatherReportUseCase();
    if(dataState is DataSuccess&&dataState.data!=null){
      emit(RemoteWeatherReportDone(dataState.data!));
    } else if(dataState is DataFailed){
      emit(RemoteWeatherReportError(dataState.response!));
    }
  }
}