import 'route.dart';

class RoutesModel {
  List<Route>? routes;

  RoutesModel({this.routes});

  factory RoutesModel.fromJson(Map<String, dynamic> json) => RoutesModel(
        routes: (json['routes'] as List<dynamic>?)
            ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'routes': routes?.map((e) => e.toJson()).toList(),
      };
}
