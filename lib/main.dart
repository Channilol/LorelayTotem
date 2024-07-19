import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorelay/screens/splash_screen.dart';
import 'package:lorelay/services/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Utils.initCategories();
  await Utils.initProducts();
  await Utils.initExtraItems();

  runApp(const ProviderScope(child: LorelayApp()));
}

class LorelayApp extends StatelessWidget {
  const LorelayApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lorelay Totem',
      home: SplashScreen(),
    );
  }
}
