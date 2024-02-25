import 'lat_lng.dart';

class Location {
  LatLng? latLng;

  Location({this.latLng});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latLng: json['latLng'] == null
            ? null
            : LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latLng': latLng?.toJson(),
      };
}
