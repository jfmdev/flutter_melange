import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentLocation() async {
  if (await Geolocator.isLocationServiceEnabled()) {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition();
    }
  }

  return null;
}
