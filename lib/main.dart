import 'package:flutter/material.dart';

import 'core/storage/local_storage_service.dart';
import 'green_gym_club.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = LocalStorageService();
  await storage.init();

  runApp(GreenGymClub());
}
