import 'location.dart';

class LocationInfo {
  Location? location;

  LocationInfo({this.location});

  factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}
