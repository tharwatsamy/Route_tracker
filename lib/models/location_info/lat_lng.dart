class LatLng {
  double? latitude;
  double? longitude;

  LatLng({this.latitude, this.longitude});

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
