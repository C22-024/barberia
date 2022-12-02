import 'package:flutter_test/flutter_test.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import 'package:barberia/features/auth/domain/entities/user.dart';

void main() {
  final user0 = User(
    id: 'id',
    email: 'email',
    lastLocation: GeoFlutterFire().point(latitude: 15, longitude: -155),
  );

  final user1 = User(
    id: 'id',
    email: 'email',
    lastLocation: GeoFlutterFire().point(latitude: 15, longitude: -155),
  );

  test(
    'should be equal even when having different `GeoFirePoint` references.',
    () {
      expect(user0, user1);
    },
  );
}
