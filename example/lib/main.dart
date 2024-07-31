import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Quran.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
