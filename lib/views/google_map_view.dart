import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:route_tracker/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:route_tracker/utils/google_maps_place_service.dart';
import 'package:route_tracker/utils/location_service.dart';
import 'package:route_tracker/widgets/custom_list_view.dart';

import '../widgets/custom_text_field.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late CameraPosition initalCameraPoistion;
  late GoogleMapsPlacesService googleMapsPlacesService;
  late LocationService locationService;
  late TextEditingController textEditingController;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  List<PlaceAutocompleteModel> places = [];
  @override
  void initState() {
    googleMapsPlacesService = GoogleMapsPlacesService();
    textEditingController = TextEditingController();
    initalCameraPoistion = const CameraPosition(target: LatLng(0, 0));
    locationService = LocationService();
    fetchPredictions();
    super.initState();
  }

  void fetchPredictions() {
    textEditingController.addListener(() async {
      if (textEditingController.text.isNotEmpty) {
        var result = await googleMapsPlacesService.getPredictions(
            input: textEditingController.text);

        places.clear();
        places.addAll(result);
        setState(() {});
      } else {
        places.clear();
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            updateCurrentLocation();
          },
          zoomControlsEnabled: false,
          initialCameraPosition: initalCameraPoistion,
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Column(
            children: [
              CustomTextField(
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomListView(places: places)
            ],
          ),
        ),
      ],
    );
  }

  void updateCurrentLocation() async {
    try {
      var locationData = await locationService.getLocation();

      LatLng currentPoistion =
          LatLng(locationData.latitude!, locationData.longitude!);

      Marker currentLocationMarker = Marker(
        markerId: const MarkerId('my location'),
        position: currentPoistion,
      );
      CameraPosition myCurrentCameraPoistion = CameraPosition(
        target: currentPoistion,
        zoom: 17,
      );
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(myCurrentCameraPoistion));
      markers.add(currentLocationMarker);
      setState(() {});
    } on LocationServiceException catch (e) {
      // TODO:
    } on LocationPermissionException catch (e) {
      // TODO :
    } catch (e) {
      // TODO:
    }
  }
}



// text field
// listen to the text field
// make request each time input changes (google maps plcaes api)
// display list of results (places )
