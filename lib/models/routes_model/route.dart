import 'polyline.dart';

class RouteModel {
  int? distanceMeters;
  String? duration;
  Polyline? polyline;

  RouteModel({this.distanceMeters, this.duration, this.polyline});

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        distanceMeters: json['distanceMeters'] as int?,
        duration: json['duration'] as String?,
        polyline: json['polyline'] == null
            ? null
            : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'distanceMeters': distanceMeters,
        'duration': duration,
        'polyline': polyline?.toJson(),
      };
}
