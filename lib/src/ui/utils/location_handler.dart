import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationHandler {
  Future<LatLng> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return LatLng(0, 0);
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }
}
