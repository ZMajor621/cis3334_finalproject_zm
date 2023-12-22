import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/screens/servant_screen.dart';
import '/models/servant.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Servant>(ServantAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Servant>('servants');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServantsScreen(),
    );
  }
}