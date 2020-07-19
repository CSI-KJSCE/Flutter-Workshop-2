import 'package:geolocator/geolocator.dart';
import '../networking/networking.dart';

Position position;
dynamic getCurrentLocation() async {
  try {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    currentData =
        await getCurrentData(long: position.longitude, lat: position.latitude);
  } catch (e) {
    print(e);
  }
  return currentData;
}

dynamic currentData;
