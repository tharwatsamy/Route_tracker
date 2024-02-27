import 'package:route_tracker/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:route_tracker/utils/google_maps_place_service.dart';
import 'package:route_tracker/utils/location_service.dart';
import 'package:route_tracker/utils/routes_service.dart';

class MapServices {
  PlacesService placesService = PlacesService();
  LocationService locationService = LocationService();
  RoutesService routesService = RoutesService();

  getPredictions(
      {required String input,
      required String sesstionToken,
      required List<PlaceModel> places}) async {
    if (input.isNotEmpty) {
      var result = await placesService.getPredictions(
          sesstionToken: sesstionToken, input: input);

      places.clear();
      places.addAll(result);
    } else {
      places.clear();
    }
  }
}
