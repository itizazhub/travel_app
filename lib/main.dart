import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'features/trips/data/models/trip_model.dart';
import 'features/trips/presentation/pages/main_screen.dart';

Future<void> main() async {
  // Ensure the Flutter widgets binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open your box.
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  // Register the adapter for the TripModel
  Hive.registerAdapter(TripModelAdapter());

  // Open the box with proper error handling
  await Hive.openBox<TripModel>('trips');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
