import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  init();

  const ip = '192.168.33.194';

  getIt<FirebaseFirestore>().settings =
      const Settings(persistenceEnabled: false);
  await getIt<FirebaseAuth>().useAuthEmulator(ip, 9099);
  await getIt<FirebaseStorage>().useStorageEmulator(ip, 9097);
  getIt<FirebaseFirestore>().useFirestoreEmulator(ip, 9098);

  runApp(const MyApp());
}
