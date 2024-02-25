import 'package:route_tracker/models/routes_model/routes_model.dart';
import 'package:http/http.dart' as http;

class RoutesService {
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  final String apiKey = 'AIzaSyC87Tt3tfO6aYids0BZStXXbrdAy05jQCI';
  Future<RoutesModel> fetchRoutes() {
    Uri url = Uri.parse(baseUrl);
  }
}
