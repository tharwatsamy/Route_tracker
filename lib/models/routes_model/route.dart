import 'polyline.dart';

class Route {
  int? distanceMeters;
  String? duration;
  Polyline? polyline;

  Route({this.distanceMeters, this.duration, this.polyline});

  factory Route.fromJson(Map<String, dynamic> json) => Route(
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
