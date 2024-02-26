import 'route.dart';

class RoutesModel {
  List<RouteModel>? routes;

  RoutesModel({this.routes});

  factory RoutesModel.fromJson(Map<String, dynamic> json) => RoutesModel(
        routes: (json['routes'] as List<dynamic>?)
            ?.map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'routes': routes?.map((e) => e.toJson()).toList(),
      };
}
