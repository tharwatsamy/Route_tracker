import 'lat_lng.dart';

class LocationModel {
  LatLngModel? latLng;

  LocationModel({this.latLng});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        latLng: json['latLng'] == null
            ? null
            : LatLngModel.fromJson(json['latLng'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latLng': latLng?.toJson(),
      };
}
