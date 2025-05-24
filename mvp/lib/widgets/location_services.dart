import 'package:geolocator/geolocator.dart';

Position? currentCoords;

// class LocationServices {

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
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied.");
      }
    }

    // If permission accesses are granted, return the user location
    return await Geolocator.getCurrentPosition();
  }

//--- Convert coordinates to address ---

// }
