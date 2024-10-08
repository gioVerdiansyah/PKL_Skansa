import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationHandler {
  Future<LatLng?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }

  Future<String?> getCurrentLocationAsString() async {
    LatLng? latLng = await getCurrentLocation();
    return latLng?.asString();
  }

  Future<List<double>?> getCurrentLocationAsList() async {
    LatLng? latLng = await getCurrentLocation();
    return latLng?.asList();
  }
}

extension LatLngExtension on LatLng {
  String asString() {
    return "$latitude, $longitude";
  }

  List<double> asList() {
    return [latitude, longitude];
  }
}