import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/storage/local_storage_service.dart';
import 'green_gym_club.dart';
import 'secondary/features_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: firebaseApiKey,
        appId: firebaseAppId,
        messagingSenderId: firebaseSenderId,
        projectId: firebaseProjectId,
        storageBucket: firebaseStorage,
      ),
    );
  } catch (_) {}

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final storage = LocalStorageService();
  await storage.init();

  runApp(GreenGymClub());
}
