import 'package:bloc_counter/injection_container.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_bloc.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_event.dart';
import 'package:bloc_counter/src/presentation/bloc/weather_report/remote/remote_weather_report_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteWeatherReportBloc>(
          create: (BuildContext context) => sl()
            ..add(
              const GetWeatherReport(),
            ),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Weather"),
          ),
          body: BlocBuilder<RemoteWeatherReportBloc, RemoteWeatherReportState>(
            builder: (context, state) {
              if (state is RemoteWeatherReportLoading) {
                return const CupertinoActivityIndicator();
              } else if (state is RemoteWeatherReportError) {
                print("error");
                return Center(
                  child: Card(
                    child: Column(
                      children: [
                        Text(state.response!.statusCode.toString()),
                        Text(state.response!.reasonPhrase.toString()),
                      ],
                    ),
                  ),
                );
              } else if (state is RemoteWeatherReportDone) {
                print('nice');
                print(state.weatherReport!.country==null);
                final weatherReport = state.weatherReport!;
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(weatherReport.country??""),
                        Text(weatherReport.name??""),
                        Text(weatherReport.main??""),
                        Text(weatherReport.temp.toString()),
                      ],
                    ),
                  ),
                );
              }
              return const Center();
            },
          ),
        ),
      ),
    );
  }
}
