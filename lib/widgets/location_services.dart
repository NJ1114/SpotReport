import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  LocationServices({this.currentCoords});

  Position? currentCoords;

  //--- Get current location coordinates [latitude and logitude] ---
  Future<Position> currentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location services is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request location permissions
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied.");
      }
    }

    // If permission accesses are granted, return the user location
    return await Geolocator.getCurrentPosition();
  }

  //--- Convert coordinates to address ---
  Future<String?> convertCoordsAddress(Position coordinates) async {
    try {
      // Gets location information latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
          coordinates.latitude, coordinates.longitude);

      Placemark place = placemarks.first;
      return "${place.street}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
      return null;
    }
  }
}
