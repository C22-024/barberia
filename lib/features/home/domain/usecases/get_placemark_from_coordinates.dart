import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class GetPlacemarkFromCoordinates {
  const GetPlacemarkFromCoordinates();

  Future<String> call(LatLng coordinates) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
        localeIdentifier: 'id_ID',
      );
      return placemarks[0].toOnelineString();
    } catch (e) {
      return coordinates.toSexagesimal();
    }
  }
}

extension _PlacemarkX on Placemark {
  String toOnelineString() {
    final name = _parsePlacemarkItem(this.name, placeholder: 'tanpa nama');
    final street = _parsePlacemarkItem(this.street);
    final subLocality = _parsePlacemarkItem(this.subLocality);
    final locality = _parsePlacemarkItem(this.locality);
    final subAdministrativeArea =
        _parsePlacemarkItem(this.subAdministrativeArea);
    final administrativeArea = _parsePlacemarkItem(this.administrativeArea);
    final country = _parsePlacemarkItem(this.country);
    final postalCode = _parsePlacemarkItem(this.postalCode, isLast: true);

    final nameAndStreet = name == street ? name : '$name$street';

    return '$nameAndStreet'
        '$subLocality'
        '$locality'
        '$subAdministrativeArea'
        '$administrativeArea'
        '$country'
        '$postalCode';
  }
}

String _parsePlacemarkItem(String? item,
    {String? placeholder, bool isLast = false}) {
  if (item == null) {
    return placeholder == null ? '' : '$placeholder, ';
  }
  return isLast ? item : '$item, ';
}
