import 'location.dart';

class LocationInfoModel {
  LocationModel? location;

  LocationInfoModel({this.location});

  factory LocationInfoModel.fromJson(Map<String, dynamic> json) =>
      LocationInfoModel(
        location: json['location'] == null
            ? null
            : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}
