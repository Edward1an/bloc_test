import 'package:equatable/equatable.dart';

class WeatherReportEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? name;
  final double? temp;
  final String? country;

  const WeatherReportEntity({
    this.id,
    this.main,
    this.description,
    this.name,
    this.temp,
    this.country,
  });

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        name,
        temp,
        country,
      ];
}
