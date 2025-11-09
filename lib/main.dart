import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/storage/local_storage_service.dart';
import 'green_gym_club.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final storage = LocalStorageService();
  await storage.init();

  await storage.setValue(LocalStorageKeys.onboardingShown, false);

  runApp(GreenGymClub());
}
